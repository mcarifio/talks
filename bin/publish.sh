#!/usr/bin/env bash

# Convert this to a Makefile (or some alternative).

here=$(readlink -f $(dirname ${BASH_SOURCE}))
slides=$(readlink -f ${here}/../slides)
suffix=${slides##*/}

target=${1:-www-data@do:html/mike.carif.io/html/talks/${suffix}}
prefix=${here}/../src

for md in $(find ${prefix} -name '*.md') ; do
    html=${md#${prefix}/}
    [[ -d ${html} ]] || mkdir -p ${html} ]]
    ( set -x; pandoc -t revealjs -s -o ${slides}/${html}.html ${md} -V revealjs-url=../../slides/reveal-js )
done
# scp changes up to blog, url currently hardcoded. Assumes lotsa ssh configuration too.
# scp -r ${blog} ${target}/${suffix}

# recursively copy the slide tree
rsync -ravuc -e ssh ${slides} ${target}

