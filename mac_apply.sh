USR=`/usr/bin/who | grep "console" | awk '{print $1}' | head -n 1`
spctl --master-disable
mount -uw /
killall Finder
curl -L https://raw.githubusercontent.com/h232ch/macsecurity/master/mac.sh -o ~/mac.sh
chmod 755 ~/mac.sh
mkdir ~/.script
mv ~/mac.sh ~/.script
# (echo "*/5 * * * * /.script/mac.sh") | sudo crontab -
# (echo "* * 20-24 * * ""[" '"$(date '"'+\%u'"')" '=' "5"' ]" && touch /home/sh.kim/test/test")  | crontab -
crontab -r
(echo "* * 1-7 * * ""[" '"$(date '"'+\%u'"')" '=' "1"' ]" && /Users/$USR/.script/mac.sh") | crontab -
/Users/$USR/.script/mac.sh
spctl --master-enable
