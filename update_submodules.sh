#!/bin/sh

# This whole file from github pct/pct.vim/update_submodule.sh

git submodule init
git submodule update

cd ~/.vim/bundle

for i in `ls`
do cd $i;
	if [ -e .git ]; then
		git checkout master; git pull;
	fi;

	cd -
done
