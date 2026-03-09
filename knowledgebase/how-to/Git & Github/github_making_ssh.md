MAKING GITHUB SSH KEY (see github-quick setup)

12 2025

Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/blue/.ssh/_ed25519
Your public key has been saved in /home/blue/.ssh/_ed25519.pub
The key fingerprint is:
SHA256:2dJpZczgWn5VY3pD61LRqZgRVO1kmwB36fd3gx5GBUc findme@scottlaing.ca
The key's randomart image is:
+---[RSA 4096]----+
|          o++++E=|
|         . =..*O=|
|          o O.X=o|
|         B * ++=o|
|        S * o...o|
|         o . +..+|
|            o . +|
|             .   |
|                 |
+----[SHA256]-----+


***

[14:42:11] blue@Mr-Belloc:~/repos/website$ git push -u origin master
Username for 'https://github.com': scolai
Password for 'https://scolai@github.com':
remote: Support for password authentication was removed on August 13, 2021.
remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
fatal: Authentication failed for 'https://github.com/scolai/website.git/'

[14:49:26] blue@Mr-Belloc:~/repos/website$ ssh-keygen -t ed25519 -C "findme@scottlaing.ca"
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/blue/.ssh/id_ed25519):
/home/blue/.ssh/id_ed25519 already exists.
Overwrite (y/n)? n
[15:07:01] blue@Mr-Belloc:~/repos/website$ ssh-keygen -t ed25519 -C "findme@scottlaing.ca"
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/blue/.ssh/id_ed25519): /home/blue/.ssh/id_eo18827
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/blue/.ssh/id_eo18827
Your public key has been saved in /home/blue/.ssh/id_eo18827.pub
The key fingerprint is:
SHA256:Os6azRmL0DHNB+hbh6L+75N3PgxNBLdndHwK5S241Jo findme@scottlaing.ca
The key's randomart image is:
+--[ED25519 256]--+
|        ... .oo  |
|     .   ..o.=...|
|    . .  .. =.+o.|
|   . o o  .+ +.. |
|    = = So  E    |
|   o * +. .      |
|  o o +. o       |
| . . Bo=. +      |
|  ..=+Xo o..     |
+----[SHA256]-----+
[15:12:04] blue@Mr-Belloc:~/repos/website$ eval "$(ssh-agent -s)"
Agent pid 1374
[15:15:03] blue@Mr-Belloc:~/repos/website$ ssh-add ~/.ssh/id_eo18827
Enter passphrase for /home/blue/.ssh/id_eo18827:
Identity added: /home/blue/.ssh/id_eo18827 (findme@scottlaing.ca)
[15:16:25] blue@Mr-Belloc:~/repos/website$ cat ~/.ssh/id_eo18827.pub
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAAq8AjkOPh8Zc72UaMXftodicsHM4QgL2H3WFLkEGMm findme@scottlaing.ca


PERSONAL ACCESS TOKEN
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


FIND KEYS ON MACHINE
ls ~/.ssh/

MOVE PUBLIC KEY SAFELY TO GITHUB
# find key location
ls ~/.ssh/
cat ~/.ssh/id_rsa.pub # to read.

contains:
-----BEGIN OPENSSH PRIVATE KEY-----
(long block of text)
-----END OPENSSH PRIVATE KEY-----
copy block into GitHub.com/<user>/<repo>/settings/secrets/actions and save
(never transfer private key via commit)
(if regenerating keys, update both server's public key and GitHub secret)

HOSTNAME:
find in FileZilla settings and in cpanel url
mtl203.greengeeks.net

USERNAME:
in FileZilla settings (provided by host when setting ftp)
beavert2

PATH:
/home/beavert2/public_html/home/beavert2/public_html # where live documents are uploaded to

SAFELY MAKE A TEST FOLDER FOR TESTING THE SSH CONNECTION (this does in no way alter existing files in /home/beavert2/public_html)
ssh REMOTE_USER@REMOTE_HOST "mkdir -p /home/beavert2/public_html/test"
ssh beavert2@mtl203.greengeeks.net "mkdir -p /home/beavert2/public_html/test"

during first time ssh connections with a hosted account the process will look like this:
ED25519 key fingerprint is SHA256:d7/9m5ravLoM0hAD/02/On5j2DALnLKCd6UCns+ZX70.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'mtl203.greengeeks.net' (ED25519) to the list of known hosts.
Connection closed by 198.72.127.235 port 22

this is normal for first time connections as the host fingerprint is not yet known to the ssh is not yet known to the ssh key. this message allows user to verify accuracy of information before introduction.
once introduced, the prompt indicates the host fingerprint has been authenticated as a known host and connection closes. now account is set up for writing to.

ssh beaver2@mtl203.greengeeks.net "mkdir -p /home/beavert2/public_html/test"
prompt asks for ftp password. the ssh key has been created locally. the public ssh key needs yet to be added to the host account's server. to fix:

COPY PUBLIC KEY TO SERVER
this appends public key to server's ~/.ssh/authorized_keys file:
ssh-copy-id -i ~/.ssh/id_rsa.pub REMOTE_USER@REMOTE_HOST
ssh-copy-id -i ~/.ssh/id_rsa.pub -p 22 beavert2@mtl203.greengeeks.net

may get prompt for password to install keys

success will look like this:
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/blue/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
beavert2@mtl203.greengeeks.net's password:
mesg: ttyname failed: Inappropriate ioctl for device

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh -p 22 'beavert2@mtl203.greengeeks.net'"
and check to make sure that only the key(s) you wanted were added.

verify keys were installed:
ssh -i ~/.ssh/_ed25519 REMOTE_USER@REMOTE_HOST
ssh -i ~/.ssh/id_ed25519 beavert2@mtl203.greengeeks.net

if connection hangs or does not complete, use verbose to establish steps in process:
ssh -i ~/.ssh/_ed25519 -v beavert2@mtl203.greengeeks.net

Will see something like:
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 19: include /etc/ssh/ssh_config.d/*.conf matched no files
debug1: /etc/ssh/ssh_config line 21: Applying options for *
debug1: Connecting to mtl203.greengeeks.net [198.72.127.235] port 22.
debug1: connect to address 198.72.127.235 port 22: Connection timed out

Need to establish reasons why connection is failing. Could be
Firewall or port block: Port 22 (SSH) may be blocked by your ISP, local firewall, or by the hosting provider.
Wrong hostname/IP: If the DNS name doesn’t resolve or points to the wrong server, the client will hang.
Server not listening on port 22: Some hosts use a non‑standard port (e.g. 2222).
Network routing issue: The packets aren’t reaching the server, so the connection stalls.

To test, try:
DNS resolution resolves to an IP
nslookup mtl203.greengeeks.net
should return address information for server
Server:         10.255.255.254
Address:        10.255.255.254#53

Non-authoritative answer:
Name:   mtl203.greengeeks.net
Address: 198.72.127.235

Test connectivity to port 22
telnet mtl203.greengeeks.net 22

Test local firewall blocking:
sudo ufw status verbose
status: inactive # means connection issue is not due to local firewall

***

LOG IN TO REMOTE SERVER VIA SSH KEY
ssh -i ~/.ssh/_ed25519 beavert2@mtl203.greengeeks.net


PREPARE RSYNC BY EXCLUDING UNNECESSARY DATA
make .txt file in project root:
rsync-exclude.txt
.git/
node_modules/
*.log
.DS_Store


BACK UP LIVE SITE
preferred method:
alias beaver-backup="ssh beavert2@mtl203.greengeeks.net 'cp -a public_html public_html_$(date +%Y%m%d_%H%M%S)'"

other method:
rsync -avz \
  beavert2@mtl203.greengeeks.net:public_html/ \
  beavert2@mtl203.greengeeks.net:public_html_$(date +%Y-%m-%d_%H-%M-%S)/




then run rsync dryrun mode:
alias beaver-dryrun="rsync -avzn --delete _site/ beavert2@mtl203.greengeeks.net:/home/beavert2/public_html/"
rsync -avz --delete --dry-run \
    -e "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no -p 22" \
    --exclude-from=$(pwd)/_admin/rsync-exclude.txt \
    ~/webace/websites/beavertatsujinguides/_site/ \
    beavert2@mtl203.greengeeks.net:/home/beavert2/public_html/


MAKE A SAFE TEST CONNECTION USING DRY-RUN FROM INSIDE LOCAL PROJECT DIRECTORY
can use ./local-site/ to represent local project directory
rsync -avz --delete --dry-run \
    -e "ssh -i ~/.ssh/_ed25519 -o StrictHostKeyChecking=no" \
    ./local-site/ REMOTE_USER@REMOTE_HOST:/home/beavert2/public_html/

rsync -avz --delete --dry-run \
    -e "ssh -i ~/.ssh/_ed25519 -o StrictHostKeyChecking=no" \
    ~/webace/websites/beavertatsujinguides/_site/ beavert2@mtl203.greengeeks.net:/home/beavert2/public_html/test


MAKE A SAFE TEST CONNECTION USING DRY-RUN FROM OUTSIDE LOCAL PROJECT DIRECTORY
when having connected to remote server from outside the project directory you need to provide the full path to the 
project directory in place of ./local-site/
rsync -avz --delete --dry-run \
    -e "ssh -i ~/.ssh/_ed25519 -o StrictHostKeyChecking=no" \
    ./local-site/ REMOTE_USER@REMOTE_HOST:/home/beavert2/public_html/

rsync -ayz --delete --dry-run \
     -e "ssh -i ~/.ssh/_ed25519 -o StrictHostKeyChecking=no" \
     ./webace/websites/beavertatsujinguides/ beavert2@mtl203.greengeeks.net


HOW TO CHECK WHICH FILES IN DRY-RUN WILL BE UPDATED 
deleting...
/folders/
files


PROTECT CERTAIN FILES FROM RSYNC DELETE (files that live on the server, like .htaccess, robots.txt)

DEPLOY TO LIVE SITE VIA RSYNC
alias beaver-deploy="rsync -avz --delete _site/ beavert2@mtl203.greengeeks.net:/home/beavert2/public_html/"

rsync -avz --delete \
    -e "ssh -i ~/.ssh/_ed25519 -o StrictHostKeyChecking=no" \
    ~/webace/websites/beavertatsujinguides/_site/ beavert2@mtl203.greengeeks.net:/home/beavert2/public_html/
