import type { ExtensionAPI, ExtensionContext } from "@earendil-works/pi-coding-agent";

type ContextModel = { contextWindow: number };
type WindowChange = { original: number; applied: number };

/**
 * Cap Pi's effective context window without replacing its compaction or footer.
 * settings.json: { "contextCap": 128000 }
 * Uses the merged settings (trusted project settings can override global ones).
 * Reload Pi after editing settings.json. No settings or model files are written.
 *
 * Pi 1.5.2: ctx.model exposes the active model object (not a copy).
 * AgentSession's threshold checks and getContextUsage() read contextWindow;
 * the standard footer displays getContextUsage(). Keep those paths in sync by
 * changing the live metadata, not compaction.reserveTokens or request payloads.
 */
export default function contextCap(pi: ExtensionAPI) {
	const changes = new Map<ContextModel, WindowChange>();
	let warnedInvalid = false;

	function readCap(ctx: ExtensionContext): number | undefined {
		const value: unknown = (pi.getSettings() as { contextCap?: unknown }).contextCap;
		if (value === undefined) return undefined;
		if (typeof value === "number" && Number.isSafeInteger(value) && value > 0) {
			return value;
		}
		if (!warnedInvalid) {
			warnedInvalid = true;
			ctx.ui.notify("context-cap: contextCap must be a positive safe integer; cap disabled.", "warning");
		}
		return undefined;
	}

	function capModel(model: ContextModel | undefined, cap: number | undefined) {
		if (!model) return;
		const previous = changes.get(model);
		// Do not overwrite a newer metadata change made by another extension.
		const original = previous && model.contextWindow === previous.applied
			? previous.original
			: model.contextWindow;
		const applied = cap === undefined ? original : Math.min(original, cap);
		if (model.contextWindow !== applied) model.contextWindow = applied;
		if (applied !== original) changes.set(model, { original, applied });
		else changes.delete(model);
	}

	function apply(ctx: ExtensionContext) {
		const cap = readCap(ctx);
		// Apply to every selection, without a provider/model allowlist. Registry
		// lookups can return fresh copies, so mutate the actual session model.
		capModel(ctx.model, cap);
	}

	pi.on("session_start", async (event, ctx) => {
		apply(ctx);
		if (event.reason === "reload" && ctx.model) {
			// Pi 1.5.2's footer caches usage by model identity, not contextWindow.
			// Refresh that identity through the public API, including when a cap
			// was removed. This records a normal same-model selection, not settings.
			const model = { ...ctx.model };
			const change = changes.get(ctx.model);
			if (change) changes.set(model, change);
			await pi.setModel(model);
		}
	});
	pi.on("model_select", (event, ctx) => {
		apply(ctx);
		capModel(event.model, readCap(ctx));
	});
	// Also cover active metadata replaced by a registry refresh.
	pi.on("before_agent_start", (_event, ctx) => apply(ctx));
	pi.on("turn_start", (_event, ctx) => apply(ctx));

	pi.on("session_shutdown", () => {
		// Restore on /reload as well, so raising/removing the cap is not sticky.
		for (const [model, { original, applied }] of changes) {
			if (model.contextWindow === applied) model.contextWindow = original;
		}
		changes.clear();
	});
}
