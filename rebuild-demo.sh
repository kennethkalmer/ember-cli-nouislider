#!/bin/bash

# Update our gh-pages branch with the latest build.
#
# This is based on ember-cli-github-pages, but using an addon is overkill.

set -ex

SHA=$(git rev-parse --short HEAD)

# Build
ember build --environment=production

# Switch to gh-pages branch
git checkout gh-pages

# Copy the generated app into the root
cp -R dist/* .

# Stage all changes including removed files
git add .
git add -u .

# Commit the changes
git commit -m "Rebuilt gh-pages from ${SHA}"

# Go back to master
git checkout -

echo "gh-pages has been rebuilt and can be pushed to origin"
