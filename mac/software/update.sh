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
if ! grep /binutils/ ~/.zshrc > /dev/null; then
  echo 'export PATH=$(brew --prefix binutils)/bin:$PATH' >> ~/.zshrc
fi
if ! grep /coreutils/ ~/.zshrc > /dev/null; then
  echo 'export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH' >> ~/.zshrc
  echo 'export MANPATH=$(brew --prefix coreutils)/libexec/gnuman:$MANPATH' >> ~/.zshrc
fi
if ! grep /findutils/ ~/.zshrc > /dev/null; then
  echo 'export PATH=$(brew --prefix findutils)/libexec/gnubin:$PATH' >> ~/.zshrc
  echo 'export MANPATH=$(brew --prefix findutils)/libexec/gnuman:$MANPATH' >> ~/.zshrc
fi
if ! grep /ed/ ~/.zshrc > /dev/null; then
  echo 'export PATH=$(brew --prefix ed)/libexec/gnubin:$PATH' >> ~/.zshrc
  echo 'export MANPATH=$(brew --prefix ed)/libexec/gnuman:$MANPATH' >> ~/.zshrc
fi
if ! grep /sed/ ~/.zshrc > /dev/null; then
  echo 'export PATH=$(brew --prefix gnu-sed)/libexec/gnubin:$PATH' >> ~/.zshrc
  echo 'export MANPATH=$(brew --prefix gnu-sed)/libexec/gnuman:$MANPATH' >> ~/.zshrc
fi
if ! grep /tar/ ~/.zshrc > /dev/null; then
  echo 'export PATH=$(brew --prefix gnu-tar)/libexec/gnubin:$PATH' >> ~/.zshrc
  echo 'export MANPATH=$(brew --prefix gnu-tar)/libexec/gnuman:$MANPATH' >> ~/.zshrc
fi
if ! grep /grep/ ~/.zshrc > /dev/null; then
  echo 'export PATH=$(brew --prefix grep)/libexec/gnubin:$PATH' >> ~/.zshrc
  echo 'export MANPATH=$(brew --prefix grep)/libexec/gnuman:$MANPATH' >> ~/.zshrc
fi

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
app-cleaner
diskwave
docker
visual-studio-code
android-studio
thunderbird
)
brew tap caskroom/cask
brew cask install ${cask_apps[@]}
brew cask upgrade ${cask_apps[@]}

## Install from App Store
brew install mas
mas install 418073146 # Snap
mas install 1295203466 # Microsoft Remote Desktop
mas install 549083868 # Display Menu
mas install 1122008420 # Table Tool
mas upgrade
