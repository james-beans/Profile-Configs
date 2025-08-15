# james-beans's PowerShell profile
# Changed last 22:05 31/05/25

# Imports:

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

# Initialize Oh My Posh with the specified theme
# Use either:
# `C:\Users\USERNAME_HERE\AppData\Local\Programs\oh-my-posh\themes\multiverse-neon.omp.json`,
# `https://raw.githubusercontent.com/james-beans/mono-style/refs/heads/main/src/monostyle.omp.json` or
# what ever theme you want from https://ohmyposh.dev/docs/themes .
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/james-beans/mono-style/refs/heads/main/src/monostyle.omp.json' | Invoke-Expression

# Aliases and custom commands:

# Remove the built-in 'curl' aliases if present
foreach ($n in 'curl') {
  if (Get-Command $n -CommandType Alias -ErrorAction SilentlyContinue) {
    Remove-Item Alias:$n -Force
  }
}

# makes touch work natively in windows.
function touch {
  param(
    [Parameter(Mandatory=$true, ValueFromRemainingArguments=$true)]
    [string[]] $paths
  )
  foreach ($path in $paths) {
    $directory = [System.IO.Path]::GetDirectoryName($path)
    if (-not [string]::IsNullOrEmpty($directory) -and -not (Test-Path $directory)) {
      # Create the directory if it doesn't exist
      New-Item -ItemType Directory -Path $directory -Force
    }
    if (Test-Path $path) {
      # Update the last write time to the current time
      (Get-Item $path).LastWriteTime = Get-Date
    } else {
      # Create an empty file
      New-Item -ItemType File -Path $path
    }
  }
}

# checks if the system has a battery and shows the charge percentage
function battery {
  $battery = Get-CimInstance -ClassName Win32_Battery

  if (-not $battery) {
    Write-Host "Battery: NO"
    throw "No battery detected."
  } else {
    Write-Host "Battery: YES"
    $charge = ($battery | Measure-Object -Property EstimatedChargeRemaining -Average).Average
    Write-Host "Charge: $charge%"
  }
}

# makes a new GUID
function newguid {
  [guid]::NewGuid().ToString()
}

# does the which command like UNIX but in PowerShell
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# copies the current folder path to the clipboard
function cdir {
  $path = Get-Location | Select-Object -ExpandProperty Path
  Set-Clipboard -Value $path
  Write-Host "Copied path: $path"
}

# ALIAS' LIST:
# if function not working use:
# Set-Alias <alias_name> <command_name>
# instead.

# `make` = `mingw32-make`
function make {
  mingw32-make
}

# `bat` = `battery`
function bat {
  battery
}

# `files` = `ii .`
function files {
  Invoke-Item .
}

# `path` = `Get-Location`
function path {
  Get-Location
}

# `profile` = `code $PROFILE`
function profile {
  code-insiders $PROFILE
}

# `codehere` = `code .`
function codehere {
  code-insiders .
}

# `compilec` = `gcc main.c -o program`
function compilec {
  gcc main.c -o program
}

function cc {
  clang
}

# `compilecpp` = `g++ main.cpp -o program`
function compilecpp {
  g++ main.cpp -o program
}

# `gitcode` = `cd <PATH>`
function gitcode {
  Set-Location E:\code-saved\github-repos
}

# `codedir` = `cd <PATH>`
function codedir {
  Set-Location E:\code-saved
}

# `gitdesk` = `start github` or opening github desktop
function gitdesk {
  Start-Process github
}

# `bcb` = `cls && sleep 1.5s && cargo run` (not actual code)
function bcb {
  Clear-Host
  Start-Sleep -Milliseconds 1500
  cargo build
  Start-Sleep -Milliseconds 1500
  cargo run
}

# CUSTOM COMMANDS

# `cfghelp` = This message.
function cfghelp {
  Write-Host "====================" -ForegroundColor Yellow
  Write-Host "PowerShell Custom $-PROFILE Commands Help" -ForegroundColor Cyan
  Write-Host "====================" -ForegroundColor Yellow
  Write-Host "Available Custom Commands:"
  Write-Host "  cfghelp   - Show this help message" -ForegroundColor Green
  Write-Host "  . $-PROFILE  (remove the dash) - Reloads the PowerShell config/profile." -ForegroundColor Green
  Write-Host "  cdir  - Copies the current folder path to the clipboard." -ForegroundColor Green
  Write-Host "  path   - Returns your current folder path." -ForegroundColor Green
  Write-Host "  profile   - Edits the $-PROFILE file." -ForegroundColor Green
  Write-Host "  compilec  - Runs `gcc main.c -o program` " -ForegroundColor Green
  Write-Host "  newguid  - Generates a new GUID." -ForegroundColor Green
  Write-Host "  bat  - Shows battery status." -ForegroundColor Green
  Write-Host "  battery  - Shows battery status." -ForegroundColor Green
  Write-Host "  bcb  - Clears and then runs `cargo build`. " -ForegroundColor Green
  Write-Host "  compilecpp - Runs `g++ main.cpp -o program` " -ForegroundColor Green
  Write-Host "  make - Runs `mingw32-make` " -ForegroundColor Green
  Write-Host "  codehere  - Opens VSCode in the current dir" -ForegroundColor Green
  Write-Host "  gitcode  - Opens the github dir inside your code folder." -ForegroundColor Green
  Write-Host "  gitdesk  - Opens Github Desktop from the terminal." -ForegroundColor Green
  Write-Host "  curl  - Runs the cURL CLI tool. Removes PowerShell's alias for curl to be something else." -ForegroundColor Green
  Write-Host "  files  - Opens the File Explorer in the current dir." -ForegroundColor Green
  Write-Host "  codedir  - Opens the folder where your code is." -ForegroundColor Green
  Write-Host "  touch  - Makes a file (from UNIX but in PS)" -ForegroundColor Green
  Write-Host "  which  - Shows where a CLI tool is located on your PC. (from UNIX but in PS)" -ForegroundColor Green
  Write-Host "====================" -ForegroundColor Yellow
}

# Sets the window's title to "_" which fits in better
$Host.UI.RawUI.WindowTitle = "_"

# Clear the terminal screen on startup
Clear-Host
