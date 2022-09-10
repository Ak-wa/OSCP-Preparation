:: Extracts zip & rar files from folder (github detects them as malware so it has to be done this way)
unrar x -r mimikatz_trunk.rar
unzip netcat-win32-1.12.zip -d netcat
wget https://eternallybored.org/misc/netcat/netcat-win32-1.11.zip
unzip netcat-win32-1.11.zip
mv netcat-1.11/ netcat/
git clone https://github.com/SecWiki/windows-kernel-exploits
