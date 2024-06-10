#!/bin/sh

echo "Starting ML serving application..."

cmd="$1"

case "$cmd" in
    "serve-dev")
        uvicorn serving.api:app --host 0.0.0.0 --port 8080 --reload 
        ;;
    "serve")
        uvicorn serving.api:app --host 0.0.0.0 --port 8080 
        ;;
    *)
        echo "Command $cmd is not a valid command for the entrypoint script"
        exit 1
        ;;
esac