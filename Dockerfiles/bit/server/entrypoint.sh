#!/bin/sh
# set -eu

file=/bit-scope/scope.json
# renaming the scope based on the env variable, if it is not already set.
if ! grep -q $SCOPE_NAME "$file"; then
  sed -ie 's/"name": .*"/"name": '\"$SCOPE_NAME\"'/g' $file
fi

exec bit "$@"
