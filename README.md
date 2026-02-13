# Cloudretail

This repository is configured to handle large files (>100MB) using Git LFS (Large File Storage).

## Prerequisites

Before working with this repository, you need to install Git LFS:

### Installing Git LFS

**Windows:**
```bash
# Download and run the installer from https://git-lfs.github.com/
# Or using Chocolatey:
choco install git-lfs
```

**macOS:**
```bash
brew install git-lfs
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get install git-lfs
```

**Linux (Fedora/RedHat):**
```bash
sudo yum install git-lfs
```

After installation, run:
```bash
git lfs install
```

## Quick Start

### Cloning the Repository

```bash
# Clone with Git LFS support
git clone https://github.com/piumisewwandi/Cloudretail.git
cd Cloudretail
git lfs pull  # Download all LFS files
```

### Adding Files to the Repository

The repository is already configured to handle large files. Simply add your files normally:

```bash
# Add all files in a directory (preserves folder structure)
git add your-folder/

# Add specific files
git add path/to/your/large-file.zip

# Commit and push
git commit -m "Add my files"
git push
```

Large files (>100MB) matching patterns in `.gitattributes` will automatically be handled by Git LFS.

## Supported Large File Types

The following file types are automatically tracked by Git LFS:
- Archives: `.zip`, `.tar.gz`, `.rar`, `.7z`
- Videos: `.mp4`, `.avi`, `.mov`, `.mkv`, `.flv`
- Audio: `.mp3`, `.wav`, `.flac`
- Databases: `.db`, `.sqlite`, `.sql`
- Images: `.psd`, `.ai`, `.tif`, `.tiff`
- Models: `.h5`, `.pb`, `.ckpt`, `.pth`, `.bin`
- And more (see `.gitattributes`)

## Need Help?

See [LARGE_FILES_GUIDE.md](LARGE_FILES_GUIDE.md) for detailed instructions on working with large files.

## Project Structure

This repository maintains the original folder structure of your files. When adding files:
- All directories and subdirectories are preserved
- File relationships remain intact
- No reorganization is needed

## Contributing

When contributing, ensure you have Git LFS installed and configured before cloning or pulling from the repository.
