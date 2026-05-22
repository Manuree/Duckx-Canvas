# Windows Uninstaller for Duckx Canvas
$ErrorActionPreference = 'Stop'

Write-Host "=======================================" -ForegroundColor Blue
Write-Host "   🗑️ Uninstalling Duckx Canvas...    " -ForegroundColor Red
Write-Host "=======================================" -ForegroundColor Blue

$InstallDir = Join-Path $HOME ".duckx-canvas\bin"
$AppDir = Join-Path $HOME ".duckx-canvas"
$ShortcutPath = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\Duckx Canvas.lnk"

# 1. Remove Application Files
if (Test-Path $AppDir) {
    Write-Host "-> Removing application directory: $AppDir..." -ForegroundColor White
    Remove-Item -Recurse -Force $AppDir
    Write-Host "✓ Removed application directory." -ForegroundColor Green
} else {
    Write-Host "-> Application directory not found." -ForegroundColor Yellow
}

# 2. Remove Start Menu Shortcut
if (Test-Path $ShortcutPath) {
    Write-Host "-> Removing Start Menu shortcut..." -ForegroundColor White
    Remove-Item -Force $ShortcutPath
    Write-Host "✓ Removed Start Menu shortcut." -ForegroundColor Green
} else {
    Write-Host "-> Start Menu shortcut not found." -ForegroundColor Yellow
}

# 3. Clean up Environment PATH
Write-Host "-> Cleaning up Environment PATH..." -ForegroundColor White
$UserPath = [Environment]::GetEnvironmentVariable("PATH", "User")
if ($UserPath.Split(';') -contains $InstallDir) {
    $NewPath = ($UserPath.Split(';') | Where-Object { $_ -ne $InstallDir }) -join ";"
    [Environment]::SetEnvironmentVariable("PATH", $NewPath, "User")
    Write-Host "✓ Removed $InstallDir from User PATH." -ForegroundColor Green
} else {
    Write-Host "✓ $InstallDir was not found in User PATH." -ForegroundColor Green
}

Write-Host ""
Write-Host "✓ Duckx Canvas has been successfully uninstalled!" -ForegroundColor Green
