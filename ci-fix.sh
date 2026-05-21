#!/bin/bash

echo "== EMERGENCY CI HOTFIX =="
echo "This harmless demo acts like a build helper with opinions about your secrets."
echo
echo "Environment variables matching CI-ish secret names:"
env | grep -iE 'token|secret|password|github|npm|aws' | cut -d= -f1 | sed 's/^/ - /' | head -n 12
echo
echo "Git remotes visible from here:"
git remote -v 2>/dev/null | sed 's/^/ - /'
echo
echo "A malicious script might ask for a personal access token next."
echo "This one only demonstrates how quickly 'build debugging' can become credential fishing."
