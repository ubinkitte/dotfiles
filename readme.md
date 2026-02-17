# UBinKitte's dotfiles

Repository of UBinKitte's dotfiles. A minimal Wayland environment powered by labwc with some elegance.  

UBinKitteのdotfileたちです。labwcを使用した最小限かつエレガンスなWayland環境+サブのKDE Plasma。

## Getting started

### Ubuntu 24.04 LTS

`sudo`, `Bash` and `curl` are required.
`sudo`と`Bash`、`curl`が必要です。

0. Add yourself sudoers
1. cd ~
2. curl -sL https://raw.githubusercontent.com/NP-F/dotfiles/main/bootstrap.sh | bash

### Non-automated steps

#### Configuring oh-my-zsh

##### Change theme

I recommend `pmcgee` theme.  
私は`pmcgee`テーマを使用しています。

##### Install zsh-extensons

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

```sh
# ~/.zshrc

plugins=(
        git
        zsh-autosuggestions
)
```

#### Downloading pictures for wallpaper

I love animes so I always use someone's illustrations as my wallpaper. They are not my own art works, so I cannot upload it.  
私はアニメが好きなので、絵師さんの書いたイラストを壁紙にしています。が、もちろんそれらをここに上げるのはマナー違反です。

I use `$HOME/Wallpapers` dir. And pic a wallpaper randomly.  
そのため、`$HOME/Wallpapers`を作成してランダムに壁紙を選んでいます。

When I cannot access my favourite wallpapers in some reason, I use [picsum.photos](https://picsum.photos) to get temporary wallpaper. Black background makes me uneasy.  
自分の推しの画像が手元にないときは[picsum.photos](https://picsum.photos)から仮の壁紙を拾っています。黒背景って怖くないですか？

```sh
mkdir -p ~/Wallpapers
curl -o ~/Wallpapers/wallpaper.jpg -L https://picsum.photos/1920/1080
```
