# Initialize Oh My Posh with the specified theme
oh-my-posh init pwsh --config 'C:\Users\James\AppData\Local\Programs\oh-my-posh\themes\multiverse-neon.omp.json' | Invoke-Expression

# ALIAS' LIST:

# `make` = `mingw32-make`
#
# if function not working use:
# Set-Alias make mingw32-make
# instead.
function make {
    mingw32-make
}

# `files` = `ii .`
function files {
    ii .
}

# `profile` = `code $PROFILE`
function profile {
    code $PROFILE
}

# `codehere` = `code .`
function codehere {
    code .
}

# `compilec` = `gcc main.cpp -o program`
function compilec {
    gcc main.cpp -o program
}

# `compilecpp` = `g++ main.cpp -o program`
function compilecpp {
    g++ main.cpp -o program
}

# `gitcode` = `cd <PATH>`
function gitcode {
    cd <EDIT_THIS_PATH>
}

# `codedir` = `cd <PATH>`
function codedir {
    cd <EDIT_THIS_PATH>
}

# `gitdesk` = `start github` or opening github desktop
function gitdesk {
    start github
}

# CUSTOM COMMANDS

# `cfghelp` = This message.
function cfghelp {
    Write-Host "====================" -ForegroundColor Yellow
    Write-Host "PowerShell Custom $-PROFILE Commands Help" -ForegroundColor Cyan
    Write-Host "====================" -ForegroundColor Yellow
    Write-Host "Available Custom Commands:"
    Write-Host "  cfghelp   - Show this help message" -ForegroundColor Green
    Write-Host "  profile   - Edits the $-PROFILE file." -ForegroundColor Green
    Write-Host "  compilec  - Runs `gcc main.cpp -o program` " -ForegroundColor Green
    Write-Host "  compilecpp - Runs `g++ main.cpp -o program` " -ForegroundColor Green
    Write-Host "  make - Runs `mingw32-make` " -ForegroundColor Green
    Write-Host "  codehere  - Opens VSCode in the current dir" -ForegroundColor Green
    Write-Host "  gitcode  - Opens the github dir inside your code folder." -ForegroundColor Green
    Write-Host "  gitdesk  - Opens Github Desktop from the terminal." -ForegroundColor Green
    Write-Host "  files  - Opens the File Explorer in the current dir." -ForegroundColor Green
    Write-Host "  codedir  - Opens the folder where your code is." -ForegroundColor Green
    Write-Host "====================" -ForegroundColor Yellow
}


# Clear the terminal screen on startup
Clear-Host
