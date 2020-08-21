USR=`/usr/bin/who | grep "console" | awk '{print $1}' | head -n 1`
SCHOME="/Users/$USR/.script"

if [ -d $SCHOME ]; then
	rm -rf $SCHOME
fi

# wget -O ~/wazuh-agent-latest.pkg http://sm.lezhin.net/files/wazuh-agent-latest.pkg
curl -L http://172.16.10.145/wazuh-agent-latest.pkg -o ~/wazuh-agent-latest.pkg
launchctl setenv WAZUH_MANAGER “172.16.10.180” && installer -pkg ~/wazuh-agent-latest.pkg -target /
rm -rf ~/wazuh-agent-latest.pkg

spctl --master-disable
mount -uw /
killall Finder
# curl -L http://172.16.10.145/mac.sh -o ~/mac.sh
curl -L https://raw.githubusercontent.com/h232ch/macsecurity/master/mac.sh -o ~/mac.sh
chmod 755 ~/mac.sh
mkdir ~/.script
mv ~/mac.sh ~/.script
# (echo "*/5 * * * * /.script/mac.sh") | sudo crontab -
# (echo "* * 20-24 * * ""[" '"$(date '"'+\%u'"')" '=' "5"' ]" && touch /home/sh.kim/test/test")  | crontab -
crontab -r
(echo "0 15 1-7 * * ""[" '"$(date '"'+\%u'"')" '=' "1"' ]" && /Users/$USR/.script/mac.sh") | crontab -
/Users/$USR/.script/mac.sh
spctl --master-enable
