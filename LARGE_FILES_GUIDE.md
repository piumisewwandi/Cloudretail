# Guide: Adding Large Files (>100MB) to Git

This guide will help you add files larger than 100MB to your Git repository while preserving your folder structure.

## Table of Contents
1. [Understanding the Problem](#understanding-the-problem)
2. [Solution: Git LFS](#solution-git-lfs)
3. [Step-by-Step Instructions](#step-by-step-instructions)
4. [Troubleshooting](#troubleshooting)
5. [Advanced Usage](#advanced-usage)

---

## Understanding the Problem

GitHub has a file size limit of 100MB. If you try to push files larger than this, you'll get an error:
```
remote: error: File your-file.zip is 150.00 MB; this exceeds GitHub's file size limit of 100.00 MB
```

Git LFS (Large File Storage) solves this by storing large files separately while keeping references in your Git repository.

---

## Solution: Git LFS

Git LFS is an extension that replaces large files with small pointer files in your repository, while storing the actual file content on a remote server.

### Benefits:
- ✅ Handle files >100MB (up to 2GB per file, 5GB total for free accounts)
- ✅ Maintain folder structure exactly as you have it
- ✅ Works seamlessly with Git commands
- ✅ No need to reorganize your files

---

## Step-by-Step Instructions

### Step 1: Install Git LFS

Choose your platform:

**Windows:**
1. Download from https://git-lfs.github.com/
2. Run the installer
3. Open Git Bash or Command Prompt
4. Run: `git lfs install`

**macOS:**
```bash
brew install git-lfs
git lfs install
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get install git-lfs
git lfs install
```

**Linux (Fedora/RHEL):**
```bash
sudo yum install git-lfs
git lfs install
```

### Step 2: Clone or Navigate to Repository

If you haven't cloned yet:
```bash
git clone https://github.com/piumisewwandi/Cloudretail.git
cd Cloudretail
```

If you already have the repository:
```bash
cd /path/to/Cloudretail
```

### Step 3: Add Your Files

The repository is already configured! Just add your files normally:

**Option A: Add entire folders (preserves structure)**
```bash
# Add all files from a directory and its subdirectories
git add your-project-folder/

# Example: Add a folder with multiple subdirectories
git add CloudRetail/
```

**Option B: Add specific files**
```bash
# Add specific large files
git add path/to/large-file.zip
git add videos/my-video.mp4
git add data/database.db
```

**Option C: Add everything**
```bash
# Add all new files in the repository
git add .
```

### Step 4: Check What Will Be Tracked by LFS

Before committing, verify which files will use LFS:
```bash
# See which files are tracked by LFS
git lfs ls-files

# Check file status
git status
```

### Step 5: Commit Your Changes

```bash
git commit -m "Add my project files with folder structure preserved"
```

### Step 6: Push to GitHub

```bash
git push origin main
# or
git push origin copilot/add-large-files-with-structure
```

Git LFS will automatically upload large files to LFS storage while pushing.

---

## Troubleshooting

### Issue: "Git LFS not installed"
**Solution:** Follow Step 1 to install Git LFS, then run `git lfs install`

### Issue: "File too large" error still appears
**Possible causes:**
1. The file type isn't in `.gitattributes`
2. Git LFS isn't installed

**Solution:**
```bash
# Install Git LFS if not installed
git lfs install

# Track specific file type manually
git lfs track "*.yourfiletype"

# Or track a specific file
git lfs track "path/to/specific-file.ext"

# Add the updated .gitattributes
git add .gitattributes

# Try adding your file again
git add your-large-file.ext
git commit -m "Add large file"
git push
```

### Issue: Need to track additional file types
**Solution:**
```bash
# Track new file patterns
git lfs track "*.newextension"

# Example: Track all .iso files
git lfs track "*.iso"

# Commit the updated .gitattributes
git add .gitattributes
git commit -m "Track .iso files with LFS"
```

### Issue: Want to see LFS storage usage
**Solution:**
```bash
# Check LFS file information
git lfs ls-files

# See detailed info about LFS objects
git lfs status
```

### Issue: Clone is very slow
**Solution:** Git LFS downloads large files. For faster cloning:
```bash
# Clone without downloading LFS files initially
GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/piumisewwandi/Cloudretail.git

# Later, download specific LFS files when needed
cd Cloudretail
git lfs pull
```

---

## Advanced Usage

### Track Files by Size

Track all files larger than 100MB regardless of type:
```bash
# Find files larger than 100MB
find . -type f -size +100M

# Track them with LFS
git lfs track "path/to/large-file.ext"
```

### Migrate Existing Large Files

If you already committed large files without LFS:
```bash
# This will rewrite history - use with caution!
git lfs migrate import --include="*.zip,*.mp4" --everything
```

### Check LFS Bandwidth and Storage

```bash
# See LFS storage info (requires GitHub CLI or checking GitHub settings)
git lfs env
```

### Exclude Files from LFS Later

If you want to stop tracking a file pattern:
```bash
# Remove from .gitattributes
git lfs untrack "*.ext"

# Commit the change
git add .gitattributes
git commit -m "Stop tracking .ext files with LFS"
```

---

## File Organization Tips

### Preserving Your Folder Structure

Git naturally preserves folder structures. Just add folders as they are:

```
Your original structure:
CloudRetail/
├── frontend/
│   ├── assets/
│   │   └── videos/
│   │       └── demo.mp4 (150MB)
│   └── src/
└── backend/
    └── data/
        └── database.db (200MB)

After adding to Git:
✓ Structure is identical
✓ Large files in LFS
✓ Small files in regular Git
```

Commands:
```bash
# Just add the top-level folder
git add CloudRetail/

# Or add everything
git add .

# Folder structure is automatically preserved!
```

### Best Practices

1. **Keep large files organized**: Group large files by type or purpose
2. **Use descriptive commit messages**: Mention what large files you're adding
3. **Don't mix huge files with code changes**: Separate commits for better history
4. **Test before pushing**: Run `git lfs ls-files` to verify LFS tracking

---

## Quick Reference

| Command | Purpose |
|---------|---------|
| `git lfs install` | Set up Git LFS (one-time) |
| `git lfs track "*.ext"` | Track file type with LFS |
| `git lfs ls-files` | List files in LFS |
| `git lfs status` | Check LFS status |
| `git lfs pull` | Download LFS files |
| `git add folder/` | Add folder (preserves structure) |
| `git lfs migrate import` | Convert existing files to LFS |

---

## Getting Help

- Git LFS Documentation: https://git-lfs.github.com/
- GitHub LFS Help: https://docs.github.com/en/repositories/working-with-files/managing-large-files

## Summary

1. ✅ Install Git LFS: `git lfs install`
2. ✅ Add your files: `git add your-folder/`
3. ✅ Commit: `git commit -m "Your message"`
4. ✅ Push: `git push`

**Your folder structure is automatically preserved, and large files are handled by LFS!**
