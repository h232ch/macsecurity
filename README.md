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
 - sudo curl -L https://raw.githubusercontent.com/h232ch/macsecurity/master/mac_apply.sh -o ~/mac.apply.sh| chmod 755 ~/mac.apply.sh | ~/mac.apply.sh
 
 `If you want to fix excution period, Open the 
 'mac_apply.sh' and fix the crontab period.
 Crontab will excute the script as the schedule.`

3. Security Setting List
 - Password Policy
 - Last Login User Info
 - Admin account management
 - Auto Login policy
 - Screensaver policy
 - Remote Policy
 - Firewall policy
 - Security Policy
 
 The script will fix and check the MacOS Security
 Setting to be safe and Send
 Backend System The result of MacOS.
```

### Backend Source : https://github.com/h232ch/setsecurity
