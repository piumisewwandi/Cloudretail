# Example: Adding Files with Folder Structure

This document shows practical examples of adding files to the repository while preserving your folder structure.

## Example Scenario

You have a project with the following structure:

```
MyProject/
├── frontend/
│   ├── assets/
│   │   ├── images/
│   │   │   ├── logo.png (2KB)
│   │   │   └── banner.psd (150MB) ← Large file
│   │   └── videos/
│   │       └── demo.mp4 (250MB) ← Large file
│   ├── src/
│   │   ├── index.html (5KB)
│   │   └── app.js (10KB)
│   └── package.json (1KB)
├── backend/
│   ├── data/
│   │   ├── users.db (180MB) ← Large file
│   │   └── config.json (2KB)
│   └── api/
│       └── server.py (15KB)
└── docs/
    └── manual.pdf (5MB)
```

## Step-by-Step: Adding This Structure

### Step 1: Navigate to your repository

```bash
cd /path/to/Cloudretail
```

### Step 2: Copy or move your files

```bash
# Option A: Copy your entire project folder here
cp -r /path/to/MyProject/* .

# Option B: Move your project folder
mv /path/to/MyProject/* .

# Your repository now looks like:
# Cloudretail/
# ├── frontend/
# ├── backend/
# └── docs/
```

### Step 3: Add everything to Git

```bash
# Add all files - Git LFS will automatically handle the large ones
git add .

# Or add specific folders
git add frontend/
git add backend/
git add docs/
```

### Step 4: Check what will be committed

```bash
# See all files to be committed
git status

# See which files are tracked by Git LFS
git lfs ls-files
```

Expected output:
```
Git LFS objects to be committed:

frontend/assets/images/banner.psd (150MB)
frontend/assets/videos/demo.mp4 (250MB)
backend/data/users.db (180MB)

Regular Git files:
frontend/src/index.html
frontend/src/app.js
backend/api/server.py
docs/manual.pdf
... (and all other small files)
```

### Step 5: Commit and push

```bash
git commit -m "Add MyProject with complete folder structure

- Frontend assets including large PSD and video files
- Backend API and database
- Documentation"

git push
```

## Result

Your repository on GitHub will maintain **exactly** the same structure:

```
Cloudretail/ (on GitHub)
├── frontend/
│   ├── assets/
│   │   ├── images/
│   │   │   ├── logo.png ← Regular Git
│   │   │   └── banner.psd ← Git LFS (150MB)
│   │   └── videos/
│   │       └── demo.mp4 ← Git LFS (250MB)
│   ├── src/
│   │   ├── index.html ← Regular Git
│   │   └── app.js ← Regular Git
│   └── package.json ← Regular Git
├── backend/
│   ├── data/
│   │   ├── users.db ← Git LFS (180MB)
│   │   └── config.json ← Regular Git
│   └── api/
│       └── server.py ← Regular Git
└── docs/
    └── manual.pdf ← Regular Git
```

## Multiple Folders Example

If you have multiple separate projects:

```bash
# Add each project separately
git add Project1/
git commit -m "Add Project1"
git push

git add Project2/
git commit -m "Add Project2"
git push

git add Project3/
git commit -m "Add Project3"
git push
```

Or all at once:

```bash
git add Project1/ Project2/ Project3/
git commit -m "Add all projects"
git push
```

## Common Patterns

### Pattern 1: Website with media files
```bash
git add website/
# Automatically handles:
# - Large images (PSD, TIFF)
# - Videos (MP4, AVI)
# - Archives (ZIP, TAR.GZ)
```

### Pattern 2: Application with installers
```bash
git add application/
# Automatically handles:
# - Executables (EXE, DMG)
# - Libraries (DLL, SO)
# - Packages (JAR, WAR)
```

### Pattern 3: Data science project
```bash
git add ml-project/
# Automatically handles:
# - Model files (H5, PTH, CKPT)
# - Datasets (CSV, PARQUET)
# - Databases (DB, SQLITE)
```

## Tips

1. **No reorganization needed**: Keep your existing folder structure
2. **Add gradually**: You can add folders one at a time if you prefer
3. **Check before pushing**: Use `git lfs ls-files` to verify LFS tracking
4. **Use descriptive commits**: Help others understand what you're adding

## Troubleshooting

### Issue: "I have nested folders many levels deep"
**Solution**: Git handles any depth automatically. Just add the top-level folder:
```bash
git add deeply/nested/folder/structure/many/levels/deep/
```

### Issue: "Some files are ignored"
**Solution**: Check `.gitignore` file. You may need to force-add specific files:
```bash
# Force add a specific ignored file
git add -f path/to/ignored-file.ext
```

### Issue: "I want to add only certain subfolders"
**Solution**: Add them individually:
```bash
git add Project/subfolder1/
git add Project/subfolder2/
# Don't add Project/subfolder3/
```

## Summary

✅ **Keep your structure**: No need to reorganize  
✅ **Add as-is**: `git add your-folder/`  
✅ **LFS is automatic**: Large files are handled automatically  
✅ **Everything preserved**: Exact same structure on GitHub  

See [LARGE_FILES_GUIDE.md](LARGE_FILES_GUIDE.md) for more detailed information.
