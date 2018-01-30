# author: Heini Fagerlund
# license: MIT
#
# Copyright (c) 2018 Heini Fagerlund
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

SHELL = /bin/sh

MAIN_FILE     = git-add-msg
AUX_FILES     = git-add-msg-config_sample.cfg
AUX_FILES    += git-add-msg-trac-service

.PHONY: all check-var

all:
	@echo "usage: make [install DEST_DIR=<path-to-git-extensions-directory>]"

check-var:
ifndef DEST_DIR
	$(error Error: DEST_DIR is not set. For usage, run 'make')
endif

install: check-var
	$(info > Installing git-add-msg to directory: '$(DEST_DIR)':)
	@install -d -m 0755 $(DEST_DIR)
	@install -m 0755 $(MAIN_FILE) $(DEST_DIR)
	@install -m 0644 $(AUX_FILES) $(DEST_DIR)
	@ls -1 $(DEST_DIR)
	@echo "> Installation completed."
