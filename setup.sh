echo ===Set Settings
# Activate character repeat if you keep pressing a button
defaults write -g ApplePressAndHoldEnabled -bool false 
# Enable Rightclick
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton
# Set Scroll direction
defaults write -g com.apple.swipescrolldirection -bool FALSE

echo ===Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo ===Install Tools
brew install git zsh bash-completion mariadb cask
echo ===Install Casks
brew cask install \
    caskroom/versions/firefox-developer-edition \
    opera vivaldi google-chrome \
    visual-studio-code iterm2 \
    filezilla sequel-pro sourcetree \
    adobe-acrobat-reader libreoffice shiftit keepassxc \
    slack skype \

echo ===Cleanup MacOS PHP
brew remove --force --ignore-dependencies httpd
brew remove --force --ignore-dependencies php70-xdebug php71-xdebug
brew remove --force --ignore-dependencies php70-imagick php71-imagick
brew remove --ignore-dependencies --force php70 php71 php72

echo ===Install PHP via Homebrew
brew install httpd php72 composer
brew install php72 --with-thttpd --with-thread-safety

echo ===Install ValetPlus
composer global require weprovide/valet-plus

echo ===Update zsh to use composer
'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.zshrc 
source ~/.zshrc

echo ===Start Homebrew Services
brew services start mariadb

echo ===Install OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Script will exit into zsh

