#!/bin/bash

# Make the script executable
chmod +x scripts/build_frontend.sh

# Build the frontend
./scripts/build_frontend.sh

# Then install with pip
$PYTHON -m pip install . -vv --no-deps --no-build-isolation