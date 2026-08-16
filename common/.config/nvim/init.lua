require("config.lazy")

vim.opt.number = true

vim.cmd [[
  highlight Normal guibg=NONE
  highlight NormalNC guibg=NONE
]]

vim.o.termguicolors = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

vim.keymap.set('v', '<C-c>', '"+y')
vim.keymap.set('i', '<C-v>', '<C-r>+')

vim.keymap.set('v', '<C-x>', '"+d')

vim.keymap.set({'n', 'i', 'v'}, '<C-s>', function()
  if vim.api.nvim_get_mode().mode == 'i' then
    vim.cmd('stopinsert')
  end
  vim.cmd('write')
  print("Saved!") 
end)

if vim.g.neovide then
	vim.g.neovide_cursor_animation_length = 0.0
	vim.g.neovide_cursor_trail_size = 0.0
	vim.g.neovide_scroll_animation_length = 0.0
	vim.o.guifont = "Cascadia Code, Cascadia Mono, Consolas, Courier New, monospace:h11"
end

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
vim.cmd([[colorscheme habamax]])
