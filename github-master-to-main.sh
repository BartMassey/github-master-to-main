#!/bin/sh
# Rename Github repo `master` branch to `main`
# Bart Massey 2024-08
#
# gh from https://addshore.com/2021/02/
#  programmatically-convert-github-master-branch-to-main
# Rest from https://github.com/github/renaming

if ! [ -d .git ] || [ "`git branch --show-current`" != "master" ]
then
    echo "must be in repo root on branch master" >&2
    exit 1
fi
OWNER_REPO="`git remote show -n origin |
  grep Fetch |
  sed -e 's=^.*github.com/==' -e 's=\.git$=='`"
if [ $? -ne 0 ]
then
    echo "could not handle origin" >&2
    exit 1
fi
GH_TOKEN="`cat $HOME/.github-oauthtoken`" gh api --silent \
  --method POST "repos/$OWNER_REPO/branches/master/rename" \
  --field new_name=main &&
git branch -m master main &&
sleep 1 &&
git fetch origin &&
git branch -u origin/main main &&
git remote set-head origin -a &&
git remote prune origin
