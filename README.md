# git-add-msg
A git extension (command line tool) that automatically logs commits to Trac and/or a changelog.

Replaces the following commands:
```
$ git add .
```
and: 
```
$ git commit -am "<insert-your-commit-message-here>"
```
and (optionally): 
```
$ git status
```
Also creates a **changelog.log** file (in your project's root directory), and (optionally) adds a comment in the Trac ticket for each commit.

## tl;dr
All of the above is accomplished by running just one command:
```
$ git add-msg
```
(Refer to 'Usage' section below.)
- - -
## Requirements
- bash version >= 4.2
- git version >= 1.7
- (optional) Trac >= v.0.12 
 - curl >= 7.21

(All copyrights for the above remain with their respective owners.)
- - -
## Installation
### Download:
Download the **git-add-msg** project in [.zip](https://github.com/hfagerlund/git-add-msg/archive/master.zip) format, or clone the repository:
```
$ git clone https://github.com/hfagerlund/git-add-msg.git
```


Place the (extracted) **git-add-msg**, **trac-service**, and **config_sample.cfg** files in ``<your-git-extensions-directory>``, and add it to your (executable) path:
```bash
export PATH="$PATH:/path/to/<your-git-extensions-directory>" #Note: no trailing slash
```

- - -
## Configuration
#### All users:
(OPTIONAL) Copy and save ``config_sample.cfg`` as ``config.cfg``. This step can be skipped (refer to note below).

**Note**: if a ``config.cfg`` file is **not** present, it will result in a warning message being displayed when the tool is run (this can be safely ignored).

- - - 
#### Trac users only:
(1.) Update ``config.cfg`` (copied from ``config_sample.cfg``) with your Trac settings by replacing the following values:
```
repo="no_repo_specified"         # replace <no_repo_specified> with the name of your Trac repository
username="no_username_specified" # (as above, but with your Trac login username)
password="no_password_specified" 
host="no_host_specified"
port="no_port_specified"
instance="no_instance_specified" 

```
**Note**: The repository name (ie. value of ``repo``) can also be changed for different Trac tickets **via the command line** using the ``-r`` option (instead of updating it manually) - refer to 'Usage' section below.

(2.) Under the Trac ``Admin`` tab, click on ``Permissions``. On the ``Manage Permissions`` page, complete the ``Grant Permission`` fields as follows:

| Subject:  | Action: |
| ------------- | ------------- |
| ``<trac-username>``  (same as ``username`` value in step 1.) | ``XML_RPC``  |
- - -
## Usage
#### All users:
```
$ git add-msg
```
Follow the prompts to add your **Trac ticket number** (optional - may be left blank if not using Trac) and **commit message**.

Done!

##### Example:
```
someuser@somehost:~/my-project$ git add-msg
Enter your (Trac) ticket number (without hash OR colon):
221
Enter your commit message (without quote marks; press ctrl-d when done):
updated content
git committing...
[master e10379d] #221: updated content
 1 files changed, 1 insertions(+), 0 deletions(-)
Trac ticket successfully updated.
Do you wish to view the git status?
	 Yes (y)
	 No (n)
## selected 'n'
Exiting.
```

#### Trac users:
(Optional configuration) Specify the name of a repository that has been added to Trac as follows:
```
$ git add-msg -r <repo-name>
```

Using the **-r** option automatically generates a link to the changeset in the Trac ticket.
- - -
## License
Copyright (c) 2015 Heini Fagerlund. Licensed under the [MIT license](http://opensource.org/licenses/mit-license.php).
(See [LICENSE](https://github.com/hfagerlund/git-add-msg/blob/master/LICENSE).)

- - -
## Changelog
* 0.1.1 - July 15, 2015. Commit messages now support additional characters: ``&``, ``"``, ``<``, and ``>``. Note: ``'`` is removed from messages.
* 0.1.0 - July 15, 2015. Initial version.
