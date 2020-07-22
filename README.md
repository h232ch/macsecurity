# Mac OS Security

## Operation
```bash
1. Apply MacOS Security Script Crontab 
2. Send Backend MacOS Security Script Result
```

## Usage
```bash
1. Download Scripts
2. Excute Script (mac_apply.sh)
 - sudo curl -L https://raw.githubusercontent.com/h232ch/macsecurity/master/mac_apply.sh -o ~/mac.apply.sh| sudo chmod 755 ~/mac.apply.sh | sudo ~/mac.apply.sh
```
 If you want to fix excution period, Open the <br>
 'mac_apply.sh' and fix the crontab period. <br>
 Crontab will excute the script as the schedule. <br>

3. Security Setting List
```bash
"Password Policy"
"Last Login User Info"
"Admin account management"
"Auto Login policy"
"Screensaver policy"
"Remote Policy"
"Firewall policy"
"Security Policy"
```

 The script will fix and check the MacOS Security<br>
 Setting to be safe and Send<br>
 Backend System The result of MacOS.<br>
### Backend Source : https://github.com/h232ch/setsecurity
