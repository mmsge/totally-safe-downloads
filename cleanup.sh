#!/bin/bash

echo "== ULTRA AGGRESSIVE SYSTEM CLEANUP =="
echo "This safe demo shows how a 'free up space' script can sound useful and be terrifying."
echo
echo "Targets a reckless script might advertise for deletion:"

for path in "$HOME/Downloads" "$HOME/Desktop" "$HOME/.cache" "$HOME/node_modules"; do
  if [ -e "$path" ]; then
    echo " - would inspect $path"
  else
    echo " - would still mention $path for dramatic effect"
  fi
done

echo
echo "Example of the kind of command you should never trust on vibes alone:"
echo 'rm -rf "$HOME/Downloads" "$HOME/Desktop" ~/.cache'
echo
echo "This demo deletes nothing. Real 'cleanup' scripts sometimes do not share that restraint."
