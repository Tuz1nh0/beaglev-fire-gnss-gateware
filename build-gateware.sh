#!/usr/bin/env bash

set -e

cd "$HOME/Documents/gateware_Blinky"

env -u CPATH -u C_INCLUDE_PATH \
    python3 build-bitstream.py "$@"
