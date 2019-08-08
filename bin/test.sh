#!/bin/sh

# Preserve newlines
IFS=

declare -a arr=("addison.framerfx")

for dir in "${arr[@]}"
do

  # Cache previous yarn.lock
  previousYarnLock=$(cat $dir/yarn.lock)

  # Update dependencies
  yarn

  # Cache new yarn.lock
  newYarnLock=$(cat $dir/yarn.lock)

  namespacedDependenciesChanged=$(node `dirname $0`/yarn-lock-diff.js @addisonkit $previousYarnLock $newYarnLock)

  if [ "$namespacedDependenciesChanged" == "true" ]; then
    # package was updated
  fi
done