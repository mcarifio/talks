# usage: `source $(git rev-parse --show-toplevel)/bin/env.source.sh` ## anywhere in git tree
# or `source /path/to/env.source.sh`

root=$(git rev-parse --show-toplevel 2>/dev/null)
hooks=$(git rev-parse --git-dir 2>/dev/null)

if [[ -z "$root" ]] ; then
    printf "git root not found, continuing..." > /dev/stderr
else
    if [[ ! -x ${hooks}/post-commit ]] ; then
        printf "Configure post-commit hook.\n"
        ln -sv ${hooks}/post-commit ${here}/post-commit
    fi
fi

# here, the directory this script lives in.
here=$(readlink -f $(dirname ${BASH_SOURCE}))

# Add here to the path so you can run all the bins.
export PATH=${here}:$PATH

printf "${here} added to path\n"
printf "Test the search path by running the "doctor.sh" script (which tests the environment)\n\n"
( set +x; doctor.sh )
