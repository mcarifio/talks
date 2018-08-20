#!/usr/bin/env bash
here=$(readlink -f $(dirname ${BASH_SOURCE}))

# Notify others that a blog post has been created.

# push content to medium
${here}/medium.sh $*

# notify the rest of the world
for s in ${here}/notify/*.notify.sh ; do ${s} $* ; done
