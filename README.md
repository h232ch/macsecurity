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
 
 `If you want to fix excution period, Open the 
 'mac_apply.sh' and fix the crontab period.
 Crontab will excute the script as the schedule.`

3. Security Setting List
Code 1. Password Policy
Code 2.Last Login User Info
Code 3.Admin account management
Code 4.Auto Login policy
Code 5.Screensaver policy
Code 6.Remote Policy
Code 7.Firewall policy
Code 8.Security Policy
```
 The script will fix and check the MacOS Security<br>
 Setting to be safe and Send<br>
 Backend System The result of MacOS.<br>
### Backend Source : https://github.com/h232ch/setsecurity
