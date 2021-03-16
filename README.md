# RemoveKB5000802
Installs a script to uninstall KB5000802 on Windows 10 machines.

HOW TO USE:

1: Install/copy SysinternalsSuite folder into next to RemoveKB5000802.bat. Two folders, a README, a license and one BAT file should be at in the main directory. Then, run RemoveKB5000802.bat

Pretty straight forward, eh? Run this script and it'll prompt you for an IP address or hostname. After verifying the device is online, it will see if KB5000802 is installed. If it is, it'll uninstall it after asking for domain name and credentials.

Although it's best to utilize mass management tools like PDQ Deploy, I hope this helps someone. Feel free to copy and modify to meet your needs.

Troubleshooting:

The only depencies are SysteminternalsSuite (please refer to HOW TO USE above) and the target computer must have permission to run unsigned Powershell scripts. Line 1 in Files/RemoveKB5000802.ps1 should take care of this, but you may need to run "set-executionpolicy remotesigned" in elevated Powershell if you run into any issues.
