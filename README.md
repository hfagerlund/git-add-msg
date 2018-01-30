# git-add-msg
A git extension (command line tool) that automatically logs commits to Trac and/or a changelog.

Replaces the following commands:
```
$ git add -A
```
and: 
```
$ git commit -am "<insert-your-commit-message-here>"
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
### Testing
- [shunit2](https://github.com/kward/shunit2) >= 2.1.0

(All copyrights for the above remain with their respective owners.)
- - -
## Installation
```
$ git clone https://github.com/hfagerlund/git-add-msg.git
$ cd git-add-msg
$ make install DEST_DIR=/path/to/your-git-extensions-directory
```
* add the path to `<your-git-extensions-directory>` to your **executable path**:
```bash
export PATH="$PATH:/path/to/your-git-extensions-directory" #Note: no trailing slash
```

### To uninstall:
Manually remove the following files from `<your-git-extensions-directory>`:
```
git-add-msg-config.cfg
git-add-msg-config_sample.cfg
git-add-msg
git-add-msg-trac-service
```
- - -
## Configuration
#### All users:
(OPTIONAL) Rename ``git-add-msg-config_sample.cfg`` to ``git-add-msg-config.cfg`` in `<your-git-extensions-directory>`. This step can be skipped (refer to note below).

**Note**: if a ``git-add-msg-config.cfg`` file is **not** present, it will result in a warning message being displayed when the tool is run (this can be safely ignored if not using Trac).

- - - 
#### Trac users only:
(1.) Update ``git-add-msg-config.cfg`` (copied from ``git-add-msg-config_sample.cfg`` in `<your-git-extensions-directory>`) with your Trac settings by replacing the following values:
```
repo="no_repo_specified"         # replace <no_repo_specified> with the **name** of your Trac repository (found in Trac under 'Administration' > 'Manage Repositories' > 'Name')
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
Enter your commit message (without quote marks; press Enter, then Ctrl+d when done):
updated content
git committing...
[master e10379d] #221: updated content
 1 files changed, 1 insertions(+), 0 deletions(-)
Trac ticket successfully updated.
```

#### Trac users:
(Optional configuration) Specify the name of a repository that has been added to Trac as follows:
```
$ git add-msg -r <repo-name>
```

Using the **-r** option automatically generates a link to the changeset in the Trac ticket.

#### Tests:
Run unit tests (in the `/tests` directory) using:
```
$ ./acceptanceTests.sh
```

**Note**: make sure that [shunit2](https://github.com/kward/shunit2) has been added to your `$PATH`.
- - -
## License
Copyright (c) 2015 Heini Fagerlund. Licensed under the [MIT license](http://opensource.org/licenses/mit-license.php).
(See [LICENSE](https://github.com/hfagerlund/git-add-msg/blob/master/LICENSE).)

- - -
## Changelog
* 0.3.1 - January 29, 2018. New feature: automated installation.
* 0.2.1 - January 29, 2018. Fixed display of changeset number in auto-generated Trac link.
* 0.2.0 - January 13, 2016. Deprecated (optional) git status check.
* 0.1.4 - December 30, 2015. Fixed display of ticket update message.
* 0.1.3 - December 30, 2015. Newlines in multi-line commit messages now display in Changelog file.
* 0.1.2 - December 29, 2015. Newlines in multi-line commit messages now display in Trac comments.
* 0.1.1 - July 15, 2015. Commit messages now support additional characters: ``&``, ``"``, ``<``, and ``>``. Note: ``'`` is removed from messages.
* 0.1.0 - July 15, 2015. Initial version.
