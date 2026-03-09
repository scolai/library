Download from website to downloads folder on windows

access download folder from wsl2
>/mnt/c/user/<username>/Downloads

copy exact name of app <xampp-linux-x64-8.2.12-0-installer.run>
>sudo ./xampp-linux-x64-8.2.12-0-installer.run

(if permission error: sudo chmod 755 xampp-linux-x64-8.2.12-0-installer.run)

install via gui

start
> sudo /opt/lampp/lampp start

(if network errors: install net-tools >sudo apt install net-tools)

test
open browser, enter localhost/dashboard

stop
>sudo /opt/lampp/lampp stop