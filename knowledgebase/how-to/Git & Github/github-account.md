findme@scottlaing.ca
scolai

***

upload changes to repo:
git add .
git commit -m "..."
git push

upload changes to branch

# check if changes outstanding
git status

# check current branch
git branch

# commit
git add .
git commit -m "changes..."

# option
git stash 

# switch branch
git checkout <target-branch> eg git checkout updating

# ensure working with latest state without overriding local files
git fetch origin

# then inspect what if anything is new to download
# shows commits on remote not yet on local branch
git log HEAD..origin/<branch> --oneline

# then, either merge manually
git merge origin/<branch>

# or rebase
git rebase origin/<branch>


# finally, upload changes
git push origin <target-branch>
