#!/bin/bash

# Set your Slack webhook URL
WEBHOOK_URL="https://hooks.slack.com/services/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"

# Define your message and channel
MESSAGE="Hello from your shell script!"
CHANNEL="#ssl-certs-github-deck"

# Send the notification using cURL
curl -X POST -H "Content-type: application/json" --data "{\"text\":\"$MESSAGE\",\"channel\":\"$CHANNEL\"}" "$WEBHOOK_URL"
