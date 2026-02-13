# Quick Reference: Git LFS for Large Files

## One-Time Setup

```bash
# 1. Install Git LFS (choose your platform)
brew install git-lfs                    # macOS
sudo apt-get install git-lfs            # Ubuntu/Debian
sudo yum install git-lfs                # Fedora/RHEL
# Windows: Download from https://git-lfs.github.com/

# 2. Initialize Git LFS
git lfs install
```

## Adding Files (Preserves Structure!)

```bash
# Add entire folders - structure is preserved automatically
git add my-folder/
git commit -m "Add my files"
git push

# That's it! Large files (>100MB) are handled automatically by LFS.
```

## What Files Are Tracked by LFS?

**Automatically tracked large file types:**
- Archives: `.zip`, `.tar.gz`, `.rar`, `.7z`
- Videos: `.mp4`, `.avi`, `.mov`, `.mkv`, `.flv`
- Audio: `.mp3`, `.wav`, `.flac`
- Databases: `.db`, `.sqlite`, `.sql`
- Images: `.psd`, `.ai`, `.tif`, `.tiff`
- Executables: `.exe`, `.dll`, `.so`, `.dylib`
- Models: `.h5`, `.pb`, `.ckpt`, `.pth`, `.bin`
- Packages: `.jar`, `.war`

See `.gitattributes` for complete list.

## Useful Commands

```bash
# Check which files are in LFS
git lfs ls-files

# See LFS status
git lfs status

# Track a new file type
git lfs track "*.newtype"
git add .gitattributes

# Clone with LFS files
git clone https://github.com/piumisewwandi/Cloudretail.git
cd Cloudretail
git lfs pull
```

## Common Questions

**Q: Will my folder structure be preserved?**  
A: Yes! Git and Git LFS preserve your exact folder structure.

**Q: How do I add folders?**  
A: Just `git add folder-name/` - it includes all subfolders.

**Q: What if I have files deeper than 100 levels?**  
A: No problem! Any depth works.

**Q: Can I add multiple folders at once?**  
A: Yes! `git add folder1/ folder2/ folder3/`

**Q: What about files not in .gitattributes?**  
A: Small files (<100MB) work normally. For large files of new types:
```bash
git lfs track "*.yourtype"
git add .gitattributes
```

## Need More Help?

- **Detailed guide:** See [LARGE_FILES_GUIDE.md](LARGE_FILES_GUIDE.md)
- **Examples:** See [EXAMPLES.md](EXAMPLES.md)  
- **Main README:** See [README.md](README.md)

## Example Workflow

```bash
# 1. One-time setup (if not done)
git lfs install

# 2. Add your project files (any structure)
git add MyProject/

# 3. Commit
git commit -m "Add MyProject with large files"

# 4. Push
git push

# Done! Large files are automatically in LFS, structure preserved.
```

---

**Remember:** You don't need to reorganize your files. Just add them as they are!
