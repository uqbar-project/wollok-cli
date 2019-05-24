#!/bin/bash
#
# Wollok Server start script
#
#

CLI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
kill -15 $(cat $CLI_DIR/wollok.pid)
