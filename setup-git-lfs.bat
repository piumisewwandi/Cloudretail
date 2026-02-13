@echo off
REM Git LFS Setup Script for Cloudretail Repository (Windows)
REM This script helps you set up Git LFS and add your files

echo ==========================================
echo   Cloudretail - Git LFS Setup Script
echo ==========================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo [X] Error: Git is not installed. Please install Git first.
    exit /b 1
)

echo [OK] Git is installed

REM Check if git-lfs is installed
git lfs version >nul 2>&1
if errorlevel 1 (
    echo.
    echo [X] Git LFS is not installed.
    echo.
    echo Please install Git LFS:
    echo   1. Download from https://git-lfs.github.com/
    echo   2. Run the installer
    echo   3. Run this script again
    echo.
    echo Or install using Chocolatey:
    echo   choco install git-lfs
    echo.
    pause
    exit /b 1
)

echo [OK] Git LFS is installed

REM Initialize Git LFS
echo.
echo Initializing Git LFS...
git lfs install

echo [OK] Git LFS initialized

REM Show current LFS tracking
echo.
echo ==========================================
echo Current LFS tracked file patterns:
echo ==========================================
if exist .gitattributes (
    findstr "filter=lfs" .gitattributes
) else (
    echo No .gitattributes file found
)

echo.
echo ==========================================
echo Setup Complete!
echo ==========================================
echo.
echo You can now add your files:
echo.
echo   # Add entire folders (preserves structure):
echo   git add your-folder/
echo.
echo   # Add specific files:
echo   git add path/to/file.zip
echo.
echo   # Commit and push:
echo   git commit -m "Add my files"
echo   git push
echo.
echo For detailed instructions, see LARGE_FILES_GUIDE.md
echo.
pause
