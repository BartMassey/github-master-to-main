# github-master-to-main: master branch renaming tool
Bart Massey 2024-08

In olden times, through an excess of negligence, the primary
branch of a Git repository was the "`master`" branch. For
reasons now obvious, folks today choose "`main`" as the
primary branch name.

However, many older repos remain.

Github provides support for cleanly renaming the default
`main` branch of a repo to `master`, both in the web
interface and in the API. The script here accesses this
support.

## Usage

* You will need to have installed Github's `gh` tool, and
  place your Github OAuth token in
  `$HOME/.github-oauthtoken`
  
* Highly recommend running `ssh add-key` with appropriate
  arguments to avoid repeated password typing (assuming your
  Github auth is being done with `ssh`)

* To find repos with a remote `master` branch: go to the
  root of the tree you want to search and `sh
  git-find-masters.sh` to get a list of affected
  directories

* To move a repo from `master` to `main` both locally and
  remotely:
  
  * Make a backup copy of the repo root using `cp -a`
  * Go to the repo root and make sure that it is clean
  * Run `sh github-master-to-main.sh`

# License

This work is licensed under the "MIT License". Please see the file
`LICENSE.txt` in this distribution for license terms.
