#!/bin/zsh
#Download and install latest google Chrome

# pop up notification to user that Chrome is being Updated and will automatically launch itself
/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -description "A Google Chrome update is available, please hit Update to begin. Chrome will restart itself when the update is complete." -button1 "Update"
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
