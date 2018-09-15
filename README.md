# fushar's macOS dotfiles

### Install iTerm2 + color scheme + font

```
brew cask install iterm2
brew tap caskroom/fonts
brew cask install font-hack-nerd-font
ln -s $HOME/dotfiles/iterm2-profile-13-inch.json $HOME/Library/Application\ Support/iTerm2/DynamicProfiles/
```

Kill all instances of iTerm2, and then restart, and set the Powerlevel9k profile as the default.

### Install zsh + oh-my-zsh

```
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/
git clone https://github.com/bhilburn/powerlevel9k ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

### Set macOS defaults

```
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
chflags nohidden ~/Library
```
