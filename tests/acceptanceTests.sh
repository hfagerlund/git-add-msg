#!/bin/bash
# Unit test(s) using shunit2 (https://github.com/kward/shunit2).
# (NOTE: All copyrights for shunit2 remain with its owner(s).)
#
# Usage:
# * make executable using: $ chmod +x acceptanceTests.sh
# * run using: $ ./acceptanceTests.sh
#
# author: Heini Fagerlund
# version: 0.2.0
# license: MIT
# 
# Copyright (c) Heini Fagerlund


testSuccessfulCommit() {
../git-add-msg <<INPUT
001
multi-line commit msg

a sample multi-
line commit message
with 3 lines
INPUT
    diff ./changelog.log ./changelog_bak.log ##where 'changelog_bak.log' is previous version of log - ie. prior to (last) commit
    assertNotNull 'Expected output differs (ie. changelog was updated)' $?
}

. shunit2
