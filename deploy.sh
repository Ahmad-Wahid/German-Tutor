#!/bin/bash

echo "🚀 Deploying German Tutor to GitHub Pages..."

# Check if git is initialized
if [ ! -d .git ]; then
    echo "❌ Git not initialized. Run: git init"
    exit 1
fi

# Check if remote exists
if ! git remote get-url origin &>/dev/null; then
    echo "❌ Remote 'origin' not set. Add your GitHub remote URL."
    exit 1
fi

# Add changes
git add .
git commit -m "Update: $(date '+%Y-%m-%d %H:%M:%S')"

# Push to GitHub
git push origin main

echo "✅ Deployed!"
echo "🌐 Your app: https://$(git config user.name).github.io/$(basename $(pwd))"
