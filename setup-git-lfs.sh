#!/bin/bash
# Git LFS Setup Script for Cloudretail Repository
# This script helps you set up Git LFS and add your files

set -e

echo "=========================================="
echo "  Cloudretail - Git LFS Setup Script"
echo "=========================================="
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Error: Git is not installed. Please install Git first."
    exit 1
fi

echo "✓ Git is installed"

# Check if git-lfs is installed
if ! command -v git-lfs &> /dev/null; then
    echo ""
    echo "❌ Git LFS is not installed."
    echo ""
    echo "Please install Git LFS for your platform:"
    echo ""
    echo "  macOS:        brew install git-lfs"
    echo "  Ubuntu/Debian: sudo apt-get install git-lfs"
    echo "  Fedora/RHEL:  sudo yum install git-lfs"
    echo "  Windows:      Download from https://git-lfs.github.com/"
    echo ""
    echo "After installation, run this script again."
    exit 1
fi

echo "✓ Git LFS is installed"

# Initialize Git LFS
echo ""
echo "Initializing Git LFS..."
git lfs install

echo "✓ Git LFS initialized"

# Show current LFS tracking
echo ""
echo "=========================================="
echo "Current LFS tracked file patterns:"
echo "=========================================="
if [ -f .gitattributes ]; then
    grep "filter=lfs" .gitattributes | cut -d' ' -f1
else
    echo "No .gitattributes file found"
fi

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "You can now add your files:"
echo ""
echo "  # Add entire folders (preserves structure):"
echo "  git add your-folder/"
echo ""
echo "  # Add specific files:"
echo "  git add path/to/file.zip"
echo ""
echo "  # Commit and push:"
echo "  git commit -m 'Add my files'"
echo "  git push"
echo ""
echo "For detailed instructions, see LARGE_FILES_GUIDE.md"
echo ""
