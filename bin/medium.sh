#!/usr/bin/env bash
here=$(readlink -f $(dirname ${BASH_SOURCE}))
me=$(readlink -f ${BASH_SOURCE})
blog=$(readlink -f ${here}/..)

echo ${me} $*
