#!/bin/bash

echo "=== GitHub Pages Setup for German Tutor ==="

# Get repository name
echo "Enter repository name (e.g., german-tutor):"
read REPO_NAME

# Create repo on GitHub (requires gh)
if command -v gh &> /dev/null; then
    echo "Creating repository on GitHub..."
    gh repo create $REPO_NAME --public --source=. --remote=origin --push
else
    echo "⚠️  GitHub CLI not installed. Create repo manually at:"
    echo "   https://github.com/new"
    echo ""
    echo "Then run:"
    echo "   git remote add origin https://github.com/YOUR_USERNAME/$REPO_NAME.git"
    echo "   git push -u origin main"
fi

# Enable Pages
echo "Enabling GitHub Pages..."
if command -v gh &> /dev/null; then
    gh api repos/$(git config user.name)/$REPO_NAME/pages \
        --method POST \
        -f source='{"branch":"main","path":"/"}' 2>/dev/null || \
    echo "Pages already enabled or need manual setup"
fi

echo ""
echo "✅ Setup complete!"
echo "🌐 Your app will be available at:"
echo "   https://$(git config user.name).github.io/$REPO_NAME"
echo ""
echo "⏱️  Wait 1-2 minutes for the first deployment."
