#!/bin/zsh
#Download and install latest google Chrome

# pop up notification to user that Chrome is being Updated and will automatically launch itself
/usr/local/bin/jamf displayMessage -message "Your Google Chrome is being updated. It will automatically re-launch itself after the update. Do not launch it at this time. Thank you!"

# Stop Chrome and delete existing copy
killall "Google Chrome"
rm -rf /Applications/Google\ Chrome.app

# make temp folder for downloads

mkdir "/tmp/googlechrome"

# change working directory

cd "/tmp/googlechrome"

# Download Google Chrome
 
curl -L -o "/tmp/googlechrome/googlechrome.pkg" "https://dl.google.com/chrome/mac/stable/accept_tos%3Dhttps%253A%252F%252Fwww.google.com%252Fintl%252Fen_ph%252Fchrome%252Fterms%252F%26_and_accept_tos%3Dhttps%253A%252F%252Fpolicies.google.com%252Fterms/googlechrome.pkg"

# Install Google Chrome

sudo /usr/sbin/installer -pkg googlechrome.pkg -target /

#Tidy Up

sudo rm -rf "/tmp/googlechrome"

#Bless Google Chrome app

xattr -rc "/Applications/Google Chrome.app"

#Open Chrome
open /Applications/Google\ Chrome.app

exit 0
