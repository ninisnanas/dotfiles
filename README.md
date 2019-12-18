# ninis's macOS dotfiles

### Install iTerm2 + color scheme + font

```
brew cask install iterm2
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
ln -s $HOME/dotfiles/iterm2-profile-13-inch.json $HOME/Library/Application\ Support/iTerm2/DynamicProfiles/
```

### Install zsh + oh-my-zsh + syntax highlighting

```
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/
git clone https://github.com/bhilburn/powerlevel9k ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
brew install zsh-syntax-highlighting
```

Kill all instances of iTerm2, and then restart, and set the Powerlevel9k profile as the default.

### Set macOS defaults

```
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
chflags nohidden ~/Library
```
