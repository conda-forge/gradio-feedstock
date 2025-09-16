#!/bin/bash

set -e  # Exit on any error

# Check if we have Node.js
if ! command -v node &> /dev/null; then
    echo "Error: Node.js not found in PATH"
    exit 1
fi

# Check if we have pnpm
if ! command -v pnpm &> /dev/null; then
    echo "Error: pnpm not found in PATH"
    exit 1
fi

echo "Node.js version: $(node --version)"
echo "pnpm version: $(pnpm --version)"

# Check if the build_frontend script exists
if [ -f "scripts/build_frontend.sh" ]; then
    echo "Found scripts/build_frontend.sh, building frontend..."
    chmod +x scripts/build_frontend.sh
    
    # Set Node.js memory options
    export NODE_OPTIONS="--max-old-space-size=8192"
    
    # Build the frontend
    ./scripts/build_frontend.sh
else
    echo "Warning: scripts/build_frontend.sh not found, skipping frontend build"
fi

# Install with pip
echo "Installing package with pip..."
$PYTHON -m pip install . -vv --no-deps --no-build-isolation