UNIX
====

Contains a bunch of scripts (bash or python mostly) for common tasks:

* aws => shortcut for logging into remote (aws) servers with .pem files
* aws-ftp => shortcut for ftp to remote (aws) servers with .pem files
* chmod_all => chmod by file type (e.g., .py) or on directories, recursively
* create_user => create a user from public key and set SSH permissions
* create_user_root => same as above, only assumes you're root when running
* docker_clean -> shortcut to remove all stopped containers and all untagged images
* git_rewrite => script for rewriting commit history (useful when merging two repos)
* qsync => short cut for rsync'ing files between local and remote host
