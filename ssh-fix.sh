#!/bin/bash

echo "== SSH FIXER PRO =="
echo "This safe demo imitates a script that claims to repair your SSH setup."
echo
echo "Public keys found: $(find "$HOME/.ssh" -maxdepth 1 -name '*.pub' 2>/dev/null | wc -l | tr -d ' ')"
echo "Private key filenames present: $(find "$HOME/.ssh" -maxdepth 1 -type f \( -name 'id_*' ! -name '*.pub' \) 2>/dev/null | wc -l | tr -d ' ')"
echo "known_hosts present: $(test -f "$HOME/.ssh/known_hosts" && echo YES || echo NO)"
echo "SSH agent socket present: $(test -n "${SSH_AUTH_SOCK:-}" && echo YES || echo NO)"
echo
echo "A real script could now request key contents, rewrite config, or add new hosts."
echo "This one settles for sounding suspicious and then stopping."
