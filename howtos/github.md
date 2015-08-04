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

#git tags
git tag
git tag -a v1.4 -m 'my version 1.4'
git show v1.4
git tag -a v1.2 <old commit checksum>
git push origin v1.2 (push tag to remote)
git tag -d v1.2 (delete tag)
git push origin :refs/tags/v1.2
```

## Merge Github Repos

When merging two github repos, you probably want to preserve the commit history for both repos. If you want to add repoA as a folder in repoB, you should first rewrite the commit history of repoA.

Script for rewriting commit history of a repo where all files move to a subfolder and all commit history is updated.

```
#!/bin/bash
#change NEWSUBFOLDER below
#on OS X replace \t with <tab>

git filter-branch --index-filter \
  'git ls-files -s | sed "s-\t\"*-&NEWSUBFOLDER/-" |
   GIT_INDEX_FILE=$GIT_INDEX_FILE.new \
   git update-index --index-info &&
   mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE"' HEAD
```
The above script is available [here](https://github.com/muneeb-ali/unix-tools/blob/master/scripts/git_rewrite). After this, the merge is as simple as 

```
cd repoB
git branch <newbranch>
git checkout <newbranch>
git pull <path-to-repoA>
git push -u origin <newbranch>
```

## Cleanup Commit History

While doing rapid development sometimes you commit files that turn out to be irrelevant for the project or you figure out a much better way of doing something. To remove old or temporarily files/folders from your commit history you can use [bfg](https://rtyley.github.io/bfg-repo-cleaner/) (which is faster than git filter-branch).

```
brew install bfg
bfg --delete-folders <folder_name>
bfg --delete-files <file_name> # can also use wildcards e.g., *.pyc
```
