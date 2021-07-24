#! /bin/sh
# First download the perforce visual tool suite from here: http://www.perforce.com/perforce/downloads/index.html
# and copy only the p4merge.app file into your /Applications/ directory
# then run this script.

# Setup p4merge as a visual mergetool
git config --global merge.tool p4mergetool
git config --global mergetool.p4mergetool.cmd \
"/Applications/p4merge.app/Contents/Resources/launchp4merge \$PWD/\$BASE \$PWD/\$REMOTE \$PWD/\$LOCAL \$PWD/\$MERGED"
git config --global mergetool.p4mergetool.trustExitCode false
git config --global mergetool.keepBackup false
git config --global mergetool.prompt false

# Setup p4merge as a visual diff tool
git config --global diff.tool p4mergetool
git config --global difftool.p4mergetool.cmd \
"/Applications/p4merge.app/Contents/Resources/launchp4merge \$LOCAL \$REMOTE"
git config --global difftool.prompt false

# Handy alias for diffing two files, usage: p4m oldfile newfile
alias p4m="/Applications/p4merge.app/Contents/MacOS/p4merge"