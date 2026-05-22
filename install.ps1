# Windows Installer for Duckx Canvas
$ErrorActionPreference = 'Stop'

Write-Host "=======================================" -ForegroundColor Blue
Write-Host "   🎨 Installing Duckx Canvas...       " -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Blue

$Repo = "Manuree/Duckx-Canvas"
$InstallDir = Join-Path $HOME ".duckx-canvas\bin"
$TempDir = Join-Path $env:TEMP "duckx-canvas-installer"

if (Test-Path $TempDir) {
    Remove-Item -Recurse -Force $TempDir
}
$null = New-Item -ItemType Directory -Force -Path $TempDir

$Url = "https://github.com/$Repo/releases/latest/download/duckx-canvas-windows-x64.zip"
$ZipFile = Join-Path $TempDir "duckx-canvas.zip"

Write-Host "-> Downloading latest release from GitHub..." -ForegroundColor White
Invoke-RestMethod -Uri $Url -OutFile $ZipFile

Write-Host "-> Extracting package..." -ForegroundColor White
Expand-Archive -Path $ZipFile -DestinationPath $TempDir -Force

if (-not (Test-Path $InstallDir)) {
    $null = New-Item -ItemType Directory -Force -Path $InstallDir
}

Write-Host "-> Installing executable to $InstallDir..." -ForegroundColor White
Copy-Item -Path (Join-Path $TempDir "duckx-canvas.exe") -Destination (Join-Path $InstallDir "duckx-canvas.exe") -Force

# Clean up temp folder
Remove-Item -Recurse -Force $TempDir

Write-Host "-> Updating Environment PATH..." -ForegroundColor White

# Update registry path for user persistently
$UserPath = [Environment]::GetEnvironmentVariable("PATH", "User")
if ($UserPath.Split(';') -notcontains $InstallDir) {
    [Environment]::SetEnvironmentVariable("PATH", $UserPath + ";" + $InstallDir, "User")
    Write-Host "✓ Added $InstallDir to User PATH." -ForegroundColor Green
} else {
    Write-Host "✓ $InstallDir is already in User PATH." -ForegroundColor Green
}

# Update current session path
$env:Path += ";$InstallDir"

Write-Host "-> Creating Start Menu shortcut..." -ForegroundColor White
$WshShell = New-Object -ComObject WScript.Shell
$ShortcutPath = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\Duckx Canvas.lnk"
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = Join-Path $InstallDir "duckx-canvas.exe"
$Shortcut.WorkingDirectory = $InstallDir
$Shortcut.Save()
Write-Host "✓ Created Start Menu shortcut." -ForegroundColor Green

Write-Host ""
Write-Host "✓ Duckx Canvas has been installed successfully!" -ForegroundColor Green
Write-Host "Please restart your terminal session to load the updated PATH." -ForegroundColor Yellow
Write-Host "You can then run the application by typing: duckx-canvas" -ForegroundColor Cyan
