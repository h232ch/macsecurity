
mkdir /script
curl https://raw.githubusercontent.com/h232ch/macsecurity/master/mac.sh -o ~/
chmod 755 ~/mac.sh
mv ~/mac.sh /script/
(echo "*/5 * * * * /script/mac.sh") | sudo crontab -
