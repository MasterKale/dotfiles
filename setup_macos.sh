#!/bin/bash

# Thanks to https://github.com/atomantic/dotfiles for revealing some key macOS settings
# commands!

echo [Setting up OSX]

echo Closing any system preferences to prevent issues with automated changes
osascript -e 'tell application "System Preferences" to quit'
echo ✅ Done

echo Installing Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo ✅ Done

###
#
# macOS Settings
#
###

echo Setting menubar and dock to dark mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
echo ✅ Done

echo Setting screenshots to save to ~/Screenshots
mkdir ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots
echo ✅ Done

echo Disabling shadows on full-screen screenshots
defaults write com.apple.screencapture disable-shadow -bool true
echo ✅ Done

echo Showing status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true
echo ✅ Done

echo Setting hidden files to always appear in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
echo ✅ Done

echo Showing all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
echo ✅ Done

echo Setting new Finder windows to start in '$Home'
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
echo ✅ Done

echo Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
echo ✅ Done

echo Show full path in Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
echo ✅ Done

echo Restarting Finder
killall Finder
echo ✅ Done

echo Adding additional filetype support to Finder\'s preview
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package qlvideo
echo ✅Done

echo Setting up top-left hot corner to activate Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
killall Dock
echo ✅ Done

echo Setting Terminal to default to Homebrew
defaults write com.apple.Terminal "Default Window Settings" -string Homebrew
defaults write com.apple.Terminal "Startup Window Settings" -string Homebrew
echo ✅ Done

echo Creating ~/Repos folder
mkdir ~/Repos
echo ✅ Done

echo Enabling indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true
echo ✅ Done

echo Grouping windows by application in Mission Control
defaults write com.apple.dock expose-group-by-app -bool true
echo ✅ Done

echo Disabling the Mission Control Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true
echo ✅ Done

echo Disabling rearranging Mission Control Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false
echo ✅ Done

###
#
# Applications
#
###

echo Installing Pipenv + pyenv
brew install pipenv pyenv
echo ✅ Done

echo Unlinking Python3 to encourage pyenv use
brew unlink python
echo ✅ Done

echo Installing nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
echo ✅ Done

echo Installing ZSH and adding it to /etc/shells
brew install zsh zsh-completions
echo /usr/local/bin/zsh | sudo tee -a /etc/shells
echo ✅ Done

echo Installing Oh My Zsh and setting ZSH as default shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo ✅ Done

echo Installing powerlevel9k ZSH theme
git clone https://github.com/bhilburn/powerlevel9k.git $HOME/.oh-my-zsh/custom/themes/powerlevel9k
echo ✅ Done

echo Installing KDiff3
brew cask install kdiff3
echo ✅ Done

###
#
# Config Files
#
###

# Add symbolic links to the dotfiles in this directory
source $(pwd)/add_symlinks.sh

###
#
# Post-Setup Steps
#
###

echo Writing a list of additional manual steps to ~/Desktop/NextSteps.txt
echo $'Configuration:
[ ] Finder (Finder > Preferences)
  [ ] Under Sidebar > Favorites, only CHECK the following:
    [ ] iCloud Drive
    [ ] Applications
    [ ] Desktop
    [ ] Documents
    [ ] Downloads
    [ ] mmiller (~/)
[ ] Dock
  [ ] Set Download folder to sort by "Date Added"
  [ ] Set Download folder to display as "Folder"
  [ ] Set Download folder to view content as "Grid"
[ ] Terminal (After installing shell themes)
  [ ] Install a "Roboto Mono for Powerline" font (see Downloads list below)
  [ ] Set Homebrew theme\'s font to the installed Powerline font (12pt)
  [ ] Check "Use bright colors for bold text"
[ ] Keyboard (Preferences > Keyboard > Input Sources)
  [ ] Set up Japanese IME
    [ ] Uncheck all Input Modes except for default Hiragana
[ ] Internet Accounts (Preferences > Internet Accounts)
  [ ] Activate "Contacts" and "Calendars" for any inactive Google accounts"

Mac App Store:
- Airmail
- Pixelmator Pro
- Affinity Designer
- GIF Brewery
- Termius
- Xcode

Downloads:
- Firefox: https://www.mozilla.org/en-US/firefox/new/
- Roboto Mono for Powerline font: https://github.com/powerline/fonts/tree/master/RobotoMono
  - For non-4K screens, consider using Roboto Mono Light instead
- VS Code: https://code.visualstudio.com/docs/\?dv=osx
  - Install Settings Sync to grab settings from your "cloudSettings" gist
- iStat Menus: https://bjango.com/mac/istatmenus/
  - Preferences > Date & Time > Clock > Uncheck "Show date and time in menu bar"
- BetterTouchTool: https://folivora.ai/downloads
  - Basic Settings
    - Check "Launch BetterTouchTool on startup"
    - Check "Enable window snapping"
- Rambox: http://rambox.pro/\#download
- Clementine: https://www.clementine-player.org/downloads
  - Preferences > User interface > Configure Shortcuts
    - Set Next Track to Ctrl+Alt+X
    - Set Play to Ctrl+Alt+A
    - Set Play/Pause to Ctrl+Alt+S
    - Set Previous Track to Ctrl+Alt+Z
    - Set Stop to Ctrl+Alt+D
- Docker: https://store.docker.com/editions/community/docker-ce-desktop-mac
- Tower: https://www.git-tower.com/mac
- Contexts: https://contexts.co
- Sound Control: https://staticz.com/soundcontrol/

Arrangement:

- The DOCK\'s pinned applications are typically arranged as such (left-to-right):
  - Finder, Firefox, Chrome, VS Code, <git client>, <chat clients>, Airmail, Clementine
- The FINDER\'s sidebar Favorites section is typically arranged as such (top-to-bottom):
  - iCloud Drive, Desktop, mmiller (~/), Applications, Repos, Screenshots, Downloads, Documents
- The MENU BAR\'s bits are typically arranged as such (left-to-right):
  - BetterTouchTool, 1Password, IME, Volume, Wifi, VPN, Bluetooth, iStat Menu Weather, iStat Menu CPU, MacOS Battery, iStat Menu Clock
'> ~/Desktop/NextSteps.txt
echo ✅ Done

echo SETUP COMPLETE\! PLEASE REBOOT YOUR MACHINE BEFORE GETTING BACK TO WORK\!
