#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
    echo "You Must Run As Root."
    exit 1
else
    curl -fsSL https://elastic.co/start-local | sh
    return 0
fi
