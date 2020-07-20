#!/bin/bash


HOST_NAME=`hostname`
HOST_IP=`ipconfig getifaddr en0`
DATE=`date +%Y%m%d_%H:%M`

# 1. Account management

CODE_1="CODE_1"
ITEM="Password Policy"
echo "$ITEM Checking.."

# set
pwpolicy -setglobalpolicy "usingHistory=1"
pwpolicy -setglobalpolicy "minChars=10"
pwpolicy -setglobalpolicy "requiresAlpha=2"
pwpolicy -setglobalpolicy "requiresNumeric=2"
pwpolicy -setglobalpolicy "maxMinutesUntilChangePassword=129600"

# check
CHK=`pwpolicy -getglobalpolicy | grep -c "minChars"`

if [ $CHK -eq 0 ]; then
	RE="False"
	CODE_1=$CODE_1:$RE
else
	RE="True"
	CODE_1=$CODE_1:$RE
fi
unset CHK

CODE_2="CODE_2"
ITEM="Last Login User Info"
echo "$ITEM Checking.."

# set
defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME 1

# check
CHK=`defaults read /Library/Preferences/com.apple.loginwindow.plist | grep -c "SHOWFULLNAME"`

if [ $CHK -eq 0 ]; then
	RE="False"
	CODE_2=$CODE_2:$RE
else
	RE="True"
	CODE_2=$CODE_2:$RE
fi
unset CHK



CODE_3="CODE_3"
ITEM="Admin account management"
echo "$ITEM Checking.."

USR=`who | grep "console" | awk '{print $1}'`

if [ $USR == "lezhin" ]; then
	RE="False"
	CODE_3=$CODE_3:$RE
else
	RE="True"
	CODE_3=$CODE_3:$RE
fi
unset CHK


#2. Security policy

CODE_4="CODE_4"
ITEM="Auto Login policy"
echo "$ITEM Checking.."

# set
defaults delete /Library/Preferences/com.apple.loginwindow autoLoginUser > /dev/null 2>&1
rm /etc/kcpassword > /dev/null 2>&1

# check
CHK=`defaults read /Library/Preferences/com.apple.loginwindow.plist | egrep -c "autoLoginUser"`
if [ $CHK -eq 0 ]; then
	RE="True"
	CODE_4=$CODE_4:$RE
else
	RE="Fasle"
	CODE_4=$CODE_4:$RE
fi
unset CHK


CODE_5="CODE_5"
ITEM="Screensaver policy"
echo "$ITEM Checking.."

# set
defaults write /Library/Preferences/com.apple.screensaver loginWindowIdleTime 600
defaults write /Library/Preferences/com.apple.screensaver loginWindowModulePath "/System/Library/Screen Savers/FloatingMessage.saver"
defaults write /Library/Preferences/com.apple.screensaver.plist askForPassword -int 1

# check
if [ -f /Library/Preferences/com.apple.screensaver ]; then
	RE="False"
	CODE_5=$CODE_5:$RE
else
	CHK=`defaults read /Library/Preferences/com.apple.screensaver.plist loginWindowIdleTime`
	CHK2=`defaults read /Library/Preferences/com.apple.screensaver.plist | grep -c "askForPassword"`

	if [ $CHK2 -eq 1 ]; then
		CHK2=`defaults read /Library/Preferences/com.apple.screensaver.plist askForPassword`
	else
		CHK2=0
	fi

	if [ $CHK -le 600 -a $CHK2 -eq 1 ]; then
		# echo -e "[$CODE],양호,■ 기준 : 화면 보호기 설정 및 암호 설정, 대기 시간 10분 이하인 경우 양호\n■ 현황 : 화면 보호기 대기 시간 10분 이하 및 암호 설정됨" >> $SUMMARY_FILE 2>&1
		RE="True"
		CODE_5=$CODE_5:$RE
	else
		if [ $CHK -gt 600 -a $CHK2 -eq 1 ]; then
			# echo "=> 화면 보호기 대기 시간 10분 이상 설정 미흡 " >> $CREATE_FILE 2>&1
			RE="False_1"
			CODE_5=$CODE_5:$RE
		else
			# echo "=> 화면 보호기 암호 설정이 제대로 되어 있지 않음" >> $CREATE_FILE 2>&1
			RE="False_2"
			CODE_5=$CODE_5:$RE
		fi
	fi
fi
unset CHK


CODE_6="CODE_6"
ITEM="Remote Policy"
echo "$ITEM Checking.."

# set
echo "yes" | sudo systemsetup -setremotelogin off > /dev/null 2>&1
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -configure -access -off > /dev/null 2>&1

# check vnc
CHK=`netstat -na | grep "5900" | grep "tcp4" | grep -c "LISTEN"`

if [ $CHK -ge 1 ]; then
	RE="False"
	CODE_6=$CODE_6:$RE
else
	RE="True"
	CODE_6=$CODE_6:$RE
fi
unset CHK



CODE_7="CODE_7"
ITEM="Firewall policy"
echo "$ITEM Checking.."

# set
defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# check
CHK=`defaults read /Library/Preferences/com.apple.alf.plist globalstate`
if [ $CHK -eq 0 ]; then
	RE="False"
	CODE_7=$CODE_7:$RE
else
	RE="True"
	CODE_7=$CODE_7:$RE
fi
unset CHK


#3. Security Patch

CODE_8="CODE_8"
ITEM="Security Policy"
echo "$ITEM Checking.."

# software 설치
softwareupdate -ia > /dev/null 2>&1

# check
softwareupdate -l &> update.txt
CHK=`cat update.txt | grep -c "No new software available."`

if [ $CHK -eq 0 ]; then
	RE="False"
	CODE_8=$CODE_8:$RE
else
	RE="Ture"
	CODE_8=$CODE_8:$RE
fi
unset CHK

echo "Completed."

# 결과전송
RESULT="$CODE_1, $CODE_2, $CODE_3, $CODE_4, $CODE_5, $CODE_6, $CODE_7, $CODE_8"
echo $RESULT
echo {\"ip\":\"$HOST_IP\", \"time\":\"$DATE\", \"status\":\"$RESULT\"} > result.json
curl -d @./result.json -H "Content-Type: application/json" -X POST http://192.168.0.2:8080/pcs


