ERROR
 ! [rejected]        main -> main (non-fast-forward)
error: failed to push some refs to 'github.com:scolai/mini.git'

BECAUSE
That message means your local branch is behind the remote branch — someone pushed commits to main after you last updated. Fix by integrating the remote changes, resolving any conflicts, then push again.

TRY
Quick steps (run from your repo):

    Fetch and merge the remote changes:
        Simple (fetch + merge):

        git fetch origin
        git merge origin/main

        Or do both in one step:

        git pull origin main

    If there are merge conflicts, resolve them in your editor, then:

    git add <files>
    git commit

    Push your merged changes:

    git push origin main

