#!/bin/sh
set -e

# If config.json doesn't exist in the mounted volume, copy the example
if [ ! -f /app/config/config.json ] && [ -f /app/config.example.json ]; then
    echo "No config.json found, copying config.example.json as default..."
    cp /app/config.example.json /app/config/config.json
fi

# Execute the main application
exec "$@"
