
mkdir /script
curl -L https://raw.githubusercontent.com/h232ch/macsecurity/master/mac.sh -o ~/mac.sh
chmod 755 ~/mac.sh
mv ~/mac.sh /script/
(echo "*/5 * * * * /script/mac.sh") | sudo crontab -
<<<<<<< HEAD
/script/mac.sh
=======
>>>>>>> 28a8e97cb87d4d828e6d74baf3b40db9db995545
