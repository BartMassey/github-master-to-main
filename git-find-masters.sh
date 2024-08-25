#!/bin/sh
for i in *
do
    [ -d "$i"/.git ] &&
    [ -f "$i"/.git/refs/heads/master ] &&
    echo "$i"
done
