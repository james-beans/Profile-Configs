# Initialize Oh My Posh with the specified theme
oh-my-posh init pwsh --config 'C:\Users\USERNAME_HERE\AppData\Local\Programs\oh-my-posh\themes\multiverse-neon.omp.json' | Invoke-Expression

# ALIAS' LIST:

# `make` = `mingw32-make`
Set-Alias make mingw32-make

# `i` = `ii .`
function i {
    ii .
}

# `profile` = `code $PROFILE`
function profile {
    code $PROFILE
}

# `cir` = `code .`
function cir {
    code .
}

# `i` = `ii .`
function cc {
    gcc main.cpp -o program
}

# Clear the terminal screen on startup
Clear-Host
