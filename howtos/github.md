Github
====

Some common git commands:

```
git init (for new)
git add . (add all files)
git commit <file_name> (commit a single file)
git commit <file_name> -m "message" (commit one file with a message)
git commit -a -m "message" (commit all files with a message)
git clone username@server:/path/to/file.git
git add <file>
 
git push (push your changes to the server, like svn checkin)
git pull (pull changes from a server, like svn update)
git reset --hard HEAD (you normally won't need to do this)
git config -l (for displaying current configuration)
git config --global user.name "<name>" (set name)
git config --global user.email <email> (set email)

#gitignore
git config --global core.excludesfile ~/.gitignore
put *.pyc in ~/.gitignore (.gitingore is a file where you describe the types of files to ignore e.g., *.pyc)

#merge conflicts
git checkout --ours <file> (overwrite the file with *my* version)
git checkout --theirs <file> (overwrite the file with the version on the github server)

#revert last commit
git revert HEAD

#sub-module
git submodule add <name> /local/path
git submodule init
git submodule update

#at remote end
git clone --recursive git@github.com:/path/to/file.git
git submodule foreach git checkout master

#git submodule remove
delete from .gitmodules and .git/config
git rm --cached path_to_submodule
commit and delete local copy

#git branches
git branch temp (put on a new branch called 'temp')
git checkout temp (now checkout this version) 
git checkout master (now switch to the master version)
git merge  
git branch -d <branch_name> #delete branch

#git pull requests (for contributing to other projects)
git remote add --track master upstream git://github.com/upstreamname/projectname.git
git fetch upstream
git merge upstream/master

#better to make a new branch before sending a "pull request"
git branch <newfeature>
git checkout <newfeature>

#squash multiple commit messages into one (last 3 in the example below)
git rebase -i HEAD~3
git push origin <newfeature>

#GUI for merging conflicts
git mergetool

#push branch to remote 
git checkout -b <branch_name>
git push -u origin <branch_name>

#pull branch from master
git checkout <branch> # gets you "on branch <branch>"
git fetch origin # gets you up to date with origin

#merge branch with master
git checkout master
git pull origin master
git merge test
git push origin master

```