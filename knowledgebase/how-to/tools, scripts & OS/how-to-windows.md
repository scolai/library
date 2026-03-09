HOW TO CHANGE REMOTE ACCESS PORT
https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/remotepc/change-listening-port?tabs=regedit

Select the Start button, type Registry Editor, open Registry Editor from the best match list.

Using the navigation pane, expand the key HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp

In the main pane, select PortNumber

From the menu bar, select Edit > Modify, then select Decimal.

Type the new port number, and then select OK.

Close the registry editor, and restart your computer.


HOW TO TASK SCHEDULE HIBERNATION
C:\WINDOWS\system32\rundll32.exe
powrprof.dll,SetSuspendState
%windir%

HOW TO TASK SCHEDULE DISCONNECT MODEM
https://learn.microsoft.com/en-us/answers/questions/2074409/resolved-how-to-toggle-wi-fi-in-windows-11-via-the
powershell
netsh wlan disconnect # preferred
https://superuser.com/questions/1558827/how-to-automatically-turn-off-wifi-on-windows-10-during-certain-time-of-day
-command  "enable-netadapter -name wifi -confirm:$False"
-Windows Minimized Disable-Netadapter -Name "Wi-Fi" -confirm:$false