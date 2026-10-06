#!/bin/bash

# Unitalk AI Profile Distribution Installer
# Usage: ./install.sh [profile-name]
# Example: ./install.sh alma

set -e

PROFILE_NAME="${1:-alma}"
REPO_URL="https://github.com/unitalkai/profiles-distribution.git"
TEMP_DIR=$(mktemp -d)

echo "🚀 Installing Unitalk AI profile: $PROFILE_NAME"
echo ""

# Clone repo if not already cloned
if [ ! -d ".git" ]; then
    echo "📦 Cloning profile distribution..."
    git clone "$REPO_URL" "$TEMP_DIR"
    cd "$TEMP_DIR"
else
    echo "📦 Using existing repo..."
fi

# Check if profile exists
if [ ! -d "$PROFILE_NAME" ]; then
    echo "❌ Error: Profile '$PROFILE_NAME' not found in distribution"
    echo ""
    echo "Available profiles:"
    ls -1 | grep -v "^\." | grep -v "README.md" | grep -v "install.sh" | sed 's/^/  - /'
    exit 1
fi

# Install profile
echo "📥 Installing profile to ~/.hermes/profiles/$PROFILE_NAME..."
hermes profile install "./$PROFILE_NAME" --alias "$PROFILE_NAME"

# Setup .env
PROFILE_DIR="$HOME/.hermes/profiles/$PROFILE_NAME"
if [ -f "$PROFILE_DIR/.env.EXAMPLE" ] && [ ! -f "$PROFILE_DIR/.env" ]; then
    echo ""
    echo "⚙️  Setting up environment variables..."
    cp "$PROFILE_DIR/.env.EXAMPLE" "$PROFILE_DIR/.env"
    echo "📝 Edit $PROFILE_DIR/.env with your API keys"
fi

echo ""
echo "✅ Profile '$PROFILE_NAME' installed successfully!"
echo ""
echo "Next steps:"
echo "  1. Fill in your API keys: $PROFILE_DIR/.env"
echo "  2. Start the profile: hermes --profile $PROFILE_NAME"
echo "  3. Or use the alias: $PROFILE_NAME chat"
echo ""
echo "To update later:"
echo "  hermes profile update $PROFILE_NAME"
