#!/usr/bin/env bash
here=$(readlink -f $(dirname ${BASH_SOURCE}))
me=$(readlink -f ${BASH_SOURCE})

md=${2:-src/entry-$(date +%F).md}
dir=${1##*/}

cat <<EOF > ${md}
---
Author: Mike Carifio &lt;<mike@carif.io>&gt;\
Title: Title\
Date: $(date +%F)\
Tags: 
Blog: [https://mike.carif.io/blog/$(basename ${md} .md).html](https://mike.carif.io/blog/$(basename ${md} .md).html)
VCS: [https://www.github.com/mcarifio/talks/${dir}/blob/master/src/${md}](https://www.github.com/mcarifio/talks/${dir}/blob/master/src/${md})
---

# Title

# Slide 0

* Item 0
  - subitem 0
  - subitem 1
  - subitem 2

# Slide 1

# Slide 2

# Slide 3

# Slide 4


EOF

echo "- [title](./$(basename ${md}))" >> ../src/SUMMARY.md
echo ${md}
