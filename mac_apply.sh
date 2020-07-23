
spctl --master-disable
mount -uw /
killall Finder
# mkdir /script
curl -L https://raw.githubusercontent.com/h232ch/macsecurity/master/mac.sh -o ~/mac.sh
chmod 755 ~/mac.sh
# mv ~/mac.sh /script/
# (echo "*/5 * * * * /script/mac.sh") | sudo crontab -
(echo "*/5 * * * * /Users/$USR/mac.sh") | sudo crontab -
# /script/mac.sh
/Users/$USR/mac.sh
