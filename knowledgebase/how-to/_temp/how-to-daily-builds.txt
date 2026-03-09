daily builds

# update and fix
sudo apt get update
sudo apt upgrade
npm audit
npm audit fix

# building
consult pattern library for existing patterns. if none exist, write code and add pattern to library.
review structures onenote file

# lint
_site/npx stylelint <file>
_site/npx htmlhint <file>

# update to git repo
git status
git branch
git add .
git commit -m " "
git push origin <branch>

# connect via ssh to remote server
ssh -i ~/.ssh/id_rsa beavert2@mtl203.greengeeks.net

# update to website from project directory
# safe preview
rsync -avz --delete --dry-run \
    -e "ssh -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no" \
    ~/webace/websites/beavertatsujinguides/_site/ beavert2@mtl203.greengeeks.net:/home/beavert2/public_html/

# create temporary test folder to deploy to and check for errors before going live
# make a password protected file - run on local machine
htpasswd -c /home/beavert2/.htpasswd yourusername

# live
rsync -avz --delete \
    -e "ssh -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no" \
    ~/webace/websites/beavertatsujinguides/_site/ beavert2@mtl203.greengeeks.net:/home/beavert2/public_html/