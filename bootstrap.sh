#!/bin/bash

echo "== TRUSTED TOOLCHAIN INSTALLER =="
echo "This harmless demo only narrates what a real bootstrap script could try."
echo
echo "[+] Would ask for sudo to install packages you did not review"
echo "[+] Would append aliases and PATH changes to your shell profiles"
echo "[+] Would drop a helper binary somewhere earlier in PATH"
echo "[+] Would make itself sound essential so you keep it around"
echo
echo "Detected shell: ${SHELL:-unknown}"
echo "Home directory: $HOME"
echo "Profile files currently present:"

found_profile=0
for file in "$HOME/.bashrc" "$HOME/.bash_profile" "$HOME/.zshrc" "$HOME/.profile"; do
  if [ -e "$file" ]; then
    echo " - $file"
    found_profile=1
  fi
done

if [ "$found_profile" -eq 0 ]; then
  echo " - none of the usual suspects"
fi

echo
echo "A real script could now edit those files and quietly persist."
