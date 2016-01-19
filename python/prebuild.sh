#!/bin/bash

echo ""
echo "#### STARTED TRAVIS MAGIC ON $GH_REPO"

export REPO_URL="https://$GH_TOKEN@github.com/$GH_REPO.git"

git config --global user.name "travis-bot"
git config --global user.email "travis"

echo ""
echo "#### STATUS"

echo "Clone"
git clone $REPO_URL _cloned

cd _cloned

echo ""
echo "Branch list"
git branch -a

echo ""
echo "Getting csv branch"
git checkout csv

echo ""
echo "Pulling"
git pull origin csv

echo ""
echo "Checkout of master"
git checkout -b master origin/master

echo ""
echo "Merging"
git merge csv -m ":rocket: merge from travis-ci"

echo ""
echo "Run the index"
# python ./python/index_builder.py

echo ""
echo "Status"
git status

echo ""
echo "Adding new files"
git add public/assets/csv

git commit -m ":rocket: new deploy from travis-ci"

echo ""
echo "Push"

git push origin master

echo ""
echo "#### DEPLOY COMPLETE"