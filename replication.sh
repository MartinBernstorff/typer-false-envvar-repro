#!/bin/bash
set -e
uv tool uninstall repro || true # Continue in case it's not installed

# Seems to be shell-agnostic, but requires the FORCE environment variable to be set from the calling shell
# Check that it's the case
if [ -z "$FORCE" ]; then
  echo "FORCE environment variable is not set in the calling shell. Please set it to 'false' to proceed."
  echo "For most shells, you can set it with 'export FORCE=false'."
  exit 1
fi

uv tool install -e .

repro
