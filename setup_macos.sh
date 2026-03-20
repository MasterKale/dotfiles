#!/bin/bash

# Thanks to https://github.com/atomantic/dotfiles for revealing some key macOS settings
# commands!

echo [Setting up macOS]

echo Closing any system preferences to prevent issues with automated changes
osascript -e 'tell application "System Settings" to quit'
echo ✅ Done

echo Requesting sudo elevation before proceeding
sudo -v
# Keep-alive: update existing sudo time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
echo ✅ Done

# (Mar 2026) Seeing how far I can get without installing Rosetta...
# echo Installing Rosetta 2
# source $(pwd)/macos/install_rosetta.sh
# echo ✅ Done

echo Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
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

echo Setting Dock icon size
defaults write com.apple.dock tilesize -int 70
echo ✅ Done

echo Disabling resizing the Dock via the divider
defaults write com.apple.dock size-immutable -bool true
echo ✅ Done

echo Grouping windows by application in Mission Control
defaults write com.apple.dock expose-group-by-app -bool true
echo ✅ Done

echo Disabling rearranging Mission Control Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false
echo ✅ Done

echo Enabling tabbing through dialogs
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
echo ✅ Done

echo Disabling smart quote substitutions
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
echo ✅ Done

echo Disabling smart dash substitutions
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
echo ✅ Done

echo Disabling auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
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
brew unlink python3
echo ✅ Done

echo "Installing nvm (Node version management)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
echo ✅ Done

echo Installing Fonts
brew install --cask font-cascadia-code font-meslo-lg-nerd-font
echo ✅ Done

echo Installing Oh My Zsh and setting ZSH as default shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo chsh -s $(which zsh) "$USER"
echo ✅ Done

echo Installing powerlevel10k ZSH theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
echo ✅ Done

echo Installing Beyond Compare
brew install --cask beyond-compare
echo ✅ Done

echo Installing fzf
brew install fzf
echo ✅ Done

echo "Setting default branch name to 'main'"
git config --global init.defaultBranch main
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
[ ] Hot Corners (System Settings > Desktop & Dock > Hot Corners...)
  [ ] Top Left: Mission Control
  [ ] Top Right: Mission Control
  [ ] Bottom Left: Quick Note?
  [ ] Bottom Right: Notification Center
[ ] 1Password
  [ ] Set up SSH agent to sign commits
[ ] Terminal (After installing shell themes)
  [ ] Set Homebrew theme\'s font to the installed Powerline font (14pt)
[ ] Keyboard (System Settings > Keyboard > Input Sources)
  [ ] Set up Japanese IME
    [ ] Uncheck all Input Modes except for default Hiragana
[ ] Internet Accounts (System Settings > Internet Accounts)
  [ ] Activate "Contacts" and "Calendars" for any inactive Google accounts"

Mac App Store:
- Pixelmator Pro
- GIF Brewery
- Termius
- Magnet
- Soulver 3
- Broadcasts
- Color Picker

Downloads:
- VS Code: https://code.visualstudio.com/docs/\?dv=osx
  - Install Settings Sync to grab settings from your "cloudSettings" gist
- iStat Menus: https://bjango.com/mac/istatmenus/
  - System Settings > Date & Time > Clock > Uncheck "Show date and time in menu bar"
- BetterTouchTool: https://folivora.ai/downloads
  - Basic Settings
    - Check "Launch BetterTouchTool on startup"
    - Check "Enable window snapping"
- Docker: https://store.docker.com/editions/community/docker-ce-desktop-mac
- Tower: https://www.git-tower.com/mac
- SoundSource: https://rogueamoeba.com/soundsource
- Thaw: https://github.com/stonerl/Thaw
- Pastebot: https://tapbots.com/pastebot
- Tailscale: https://tailscale.com

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
