#!/bin/sh

# Homebrew
if ! which brew > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
export HOMEBREW_INSTALL_CLEANUP=1
brew upgrade

# zsh
brew install zsh zsh-completions
if ! grep '/usr/local/bin/zsh' /etc/shells > /dev/null; then
  sudo -- sh -c 'echo '/usr/local/bin/zsh' >> /etc/shells'
fi
if [ "$SHELL" != "/usr/local/bin/zsh" ]; then
  chsh -s /usr/local/bin/zsh
fi

# GNU
brew install xz
brew install binutils coreutils findutils ed gawk gnu-sed gnu-tar grep gzip

# Vim
brew install lua
brew install vim

# Ricty
brew tap sanemat/font
brew install Caskroom/cask/xquartz
brew install ricty

# Install from Homebrew
apps=(
curl
git
tig
jq
q
ag
lv
parallel
mas
nkf
pandoc
peco
sift
wget
wdiff
xmlstarlet
tmux
tree
nano
unzip
zplug
ruby
python
python@2
graphviz
libpng
libtiff
openssl
nvm
)
brew install ${apps[@]}

# Install from Homebrew cask
cask_apps=(
alfred
google-chrome
google-drive-file-stream
iterm2
karabiner-elements
slack
google-chat
google-japanese-ime
google-cloud-sdk
sourcetree
sublime-text
typora
inkdrop
drawio
postman
appcleaner
diskwave
docker
visual-studio-code
android-studio
thunderbird
microsoft-office
ssh-tunnel-manager
oracle-jdk
)
brew tap homebrew/cask
brew cask install ${cask_apps[@]}
brew cask upgrade ${cask_apps[@]}

## Install from App Store
brew install mas
mas install 418073146 # Snap
mas install 1295203466 # Microsoft Remote Desktop
mas install 549083868 # Display Menu
mas install 1122008420 # Table Tool
mas install 1176895641 # Spark
mas upgrade
