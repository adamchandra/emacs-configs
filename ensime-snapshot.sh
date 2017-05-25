#!/bin/bash

# fully compile your project
# update ensime for Emacs.
# update the server with M-x ensime-server-update.
# update your build tool plugin.
# check the tickets flagged as FAQ for Emacs and do a quick search.
# check the tickets flagged as FAQ on the server and do a quick search.
# nuke old versions of ENSIME and restart Emacs:

# rm -rf ~/.ivy2/cache/org.ensime
# rm -rf ~/.ivy2/local/
# rm -rf ~/.emacs.d/ensime
# rm -rf ~/.emacs.d/elpa/ensime*
# rm -rf ~/.emacs.d/elpa/scala-mode*
# rm -rf ~/.emacs.d/elpa/sbt-mode*

echo "Coursier"
find ~/.coursier -path '*/org/ensime/*' -type d
echo "Ivy2"
find ~/.ivy2 -name '*ensime*' -type d
echo "M2"
find ~/.m2 -name '*ensime*' -type d

echo "Uncomment to delete"
# find ~/.coursier -path '*/org/ensime/*' -type d -exec rm -r {} ';'
# find ~/.ivy2 -name '*ensime*' -type d -exec rm -r {} ';'
# find ~/.m2 -name '*ensime*' -type d -exec rm -r {} ';'
