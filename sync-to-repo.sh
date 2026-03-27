#!/bin/bash

# Sync data from browser localStorage to repository
# Usage: ./sync-to-repo.sh

echo "🔄 Syncing data to repository..."

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found. Run this script from the pharmazon-dashboard directory."
    exit 1
fi

# The data.json should already exist from the browser's "Sync" button
# Check if it exists
if [ ! -f "data.json" ]; then
    echo "❌ Error: data.json not found!"
    echo "📱 Please open the dashboard on your Mac and click the 'Sync' button first."
    echo "   This will download data.json to ~/Downloads/"
    echo ""
    echo "Then run these commands:"
    echo "  cp ~/Downloads/data.json ./data.json"
    echo "  ./sync-to-repo.sh"
    exit 1
fi

# Stage and commit
git add data.json
git commit -m "🔄 Sync data from Mac dashboard

- Updated from localStorage
- All changes will appear on other devices"

if [ $? -eq 0 ]; then
    echo "✅ Changes committed"
else
    echo "ℹ️  No changes to commit (data.json is already up to date)"
fi

# Push to repository
echo "📤 Pushing to GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo "✅ Pushed to GitHub!"
    echo ""
    echo "📱 On your phone:"
    echo "   1. Refresh the page"
    echo "   2. Your updated data will appear!"
    echo ""
    echo "⏱️  It takes ~30-60 seconds for GitHub Pages to update."
else
    echo "❌ Push failed. Check your internet connection."
    exit 1
fi
