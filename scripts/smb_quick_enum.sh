#!/bin/bash
# quick smb enumeration
# needs crackmapexec, metasploit framework, smbmap, nmap installed

if [ $# -ne 1 ]; then
        echo "Please specify target"
				echo "smb_quick.sh <target>"
		exit 1
fi

echo [+] Target: $1
echo [+] Finding SMB version
msfconsole -q -x "use auxiliary/scanner/smb/smb_version; set RHOSTS $1; run; exit"

echo [+] Trying Null sessions
smbclient --no-pass -L //$1
smbmap -H $1
crackmapexec smb $1 -u '' -p '' --shares

echo [+] Finding SMB vulns
nmap -sV --script smb-vuln* -Pn -p 139,445 $1
