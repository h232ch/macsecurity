USR=`/usr/bin/who | grep "console" | awk '{print $1}' | head -n 1`
spctl --master-disable
mount -uw /
killall Finder
# mkdir /script
curl -L https://raw.githubusercontent.com/h232ch/macsecurity/master/mac.sh -o ~/mac.sh
chmod 755 ~/mac.sh
mkdir ~/.script
mv ~/mac.sh ~/.script
# mv ~/mac.sh /.script/
# (echo "*/5 * * * * /.script/mac.sh") | sudo crontab -
# (echo "0 11 20-24 * 5 /Users/$USR/.script/mac.sh") | sudo crontab -
# /.script/mac.sh
(echo "* * 1-7 * * [ \"$(date '+\%u')\" = \"1\" ] && /Users/$USR/.script/mac.sh") | sudo crontab -l
/Users/$USR/.script/mac.sh
spctl --master-enable
