…or create a new repository on the command line

echo "# webace" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/scolai/webace.git
git push -u origin main

…or push an existing repository from the command line

git remote add origin https://github.com/scolai/webace.git
git branch -M main
git push -u origin main

**

...following initial commit, update repository from local to remote with new files etc

git init
git branch -M main
git remote add origin https://github.com/scolai/webace.git
git push -u origin main
<enter username>
<enter password>

**

ISSUES

attempting to login via password generates outdated login error:
blue@Mr-Belloc:~/webace/websites/lab$ git push -u origin main
Username for 'https://github.com': scolai
Password for 'https://scolai@github.com':
remote: Invalid username or token. Password authentication is not supported for Git operations.
fatal: Authentication failed for 'https://github.com/scolai/lab.git/'

solution (if no SSH key already set up)
GitHub no longer accepts passwords for Git over HTTPS.
Use a Personal Access Token (PAT) as the password.
Store it with: git config --global credential.helper manager-core

1. Create a GitHub Personal Access Token (PAT)
Go to: GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)

Click Generate new token (classic)

Give it a name like:
git-cli
Set expiration (90 days, 1 year, or “no expiration” depending on your preference)

Select scopes:

repo (this is enough for your workflow)

Generate token

Copy the token once — GitHub will not show it again

2. Use the token instead of your password
When you push for the first time:
git push -u origin main

Git will ask:
Username for 'https://github.com': 
Enter your GitHub username.

Then:
Password for 'https://github.com':
Paste your token, not your GitHub password.

3. Store the token so you don’t have to enter it again
Run:
git config --global credential.helper store
This saves the token in a local credential file so future pushes are seamless.

If you prefer the more secure Windows Credential Manager:
git config --global credential.helper manager-core
This stores the token securely in the OS vault.

4. Verify your remote URL is HTTPS (not SSH)
Check:
git remote -v

If it shows SSH (git@github.com:), then the token won’t work.

Switch to HTTPS:
git remote set-url origin https://github.com/USERNAME/REPO.git

5. (Optional) Switch to SSH keys instead of tokens
If you prefer never dealing with tokens again, SSH is the cleanest long‑term path:

Generate SSH key

Add it to GitHub

Use the SSH remote URL

But for your knowledgebase, the PAT method is the correct “quick fix.”

**

solution (using SSH key)

If GitHub rejects HTTPS authentication:
1. Check remote: git remote -v
2. Switch to SSH:
   git remote set-url origin git@github.com:USERNAME/REPO.git
3. Push normally with SSH:
   git push -u origin main

1. Check your current remote URL
Run this inside your repo:
git remote -v

If you see something like:
https://github.com/USERNAME/REPO.git
…that’s why Git is asking for a token.

2. Switch the remote to SSH
Replace the HTTPS URL with the SSH one:
git remote set-url origin git@github.com:USERNAME/REPO.git

You can confirm it worked:
git remote -v

You should now see:
origin  git@github.com:USERNAME/REPO.git (fetch)
origin  git@github.com:USERNAME/REPO.git (push)









**

$ git commit -m “version 1”
On branch master
Your branch is up to date with ‘origin/master’.
nothing to commit, working tree clean

delete repo:
>rm -rf .git/<repo>
then make new repo.

**

$ git branch -M main
error: refname refs/heads/master not found
fatal: Branch rename failed


may be due to trying to remote push without first initializing repo.  for first commit, only do basic README.md, gitignore commit.  may have to delete/remake local repository (see above).

**

...hidden repo / .git folder in '<directory>'
[17:05:35] blue@Mr-Belloc:~/webace$ git add .
error: 'protos/' does not have a commit checked out
fatal: adding files failed

delete repo 

**

NO UPDATES TO REMOTE REPOSITORY AFTER PUSH FROM LOCAL. NO ERRORS:
>Branch 'main' set up to track remote branch 'main' from 'origin'.
Everything up-to-date

...be careful to check there are no conflicting repos installed upstream/downstream.  check using 'ls -a' for hidden .git folders.


**

check uptodate urls of repositories
>git remote -v


**

Creating a GitHub Pages site
https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site
https://pages.github.com/

...go to relevant repository settings and scroll to bottom DANGER ZONE.  set to public (private is default). then go to Pages and set Branch setting to main / root.

**

NO SUCH FILE OR DIRECTORY
$ /mnt/c/user/slain/Downloads
-bash: /mnt/c/user/slain/Downloads: No such file or directory

$ is bash and therefor is trying to execute a file

use a command: 
$ cd /mnt/c/user/slain/Downloads
$ ls /mnt/c/user/slain/Downloads

**


>

