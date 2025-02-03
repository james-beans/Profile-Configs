# Windows Config

<br />

> [!TIP]
> I use Windows 11. This setup will not work for **all** versions of Windows. Anything before Windows 10 (e.g. Windows 95, 98, 2000, XP, 7 and  8) I wouldn't recommend trying to run this setup on.

> [!TIP]
> Run most (see warning below) of these commands to install from an administrator Powershell window.

> [!WARNING]
> Scoop will not install from the command using an administrator Powershell window. Install Scoop seperately (still before Nano-For-Windows) without administrator.

### - Dependencies:
  - Install Windows terminal from [the Microsoft Store](https://apps.microsoft.com/detail/9n0dx20hk701?hl=en-gb&gl=US)
  - Install Chocolatey package manager from [the individual install webiste](https://chocolatey.org/install#individual)
  - Install Scoop package manager using `irm get.scoop.sh | iex`
  - Install Visual Studio Code from [the install website](https://code.visualstudio.com/download)
  - Install Github Desktop from [the install website](https://desktop.github.com/download/)
  - Install Git from [the install website](https://git-scm.com/downloads/win)
  - Install Zig from [the install website](https://ziglang.org/learn/getting-started/)
  - Install MinGW using `choco install mingw`
  - Install Oh-My-Posh using `winget install JanDeDobbeleer.OhMyPosh -s winget`
  - Install Nano-For-Windows using `scoop bucket add .oki https://github.com/okibcn/Bucket` and then `scoop install nano`

> [!TIP]
> You can install the [insiders edition of VSCode](https://code.visualstudio.com/insiders/) for the latest VSCode updates but you will need to change the word `code` to `code-insiders` in the [PROFILE.ps1 file](/Windows/Powershell/PROFILE.ps1). You also might need to install the original VSCode and then sync the settings with a Github account over to the insiders version. When syncing from insiders side select `stable` not `insiders` so you get the same extensions and setup. 

> [!WARNING]
> You will need to replace `USERNAME_HERE` in the Oh-My-Posh url listed at the top of the [PROFILE.ps1 file](/Windows/Powershell/PROFILE.ps1).

> [!WARNING]
> The VSCode settings file will require you to install a list of extensions and manually change the `zig.zls.path` to the path of your Zig compiler executable. The extensions you need are listed with links in the [extensions list](/Windows/VSCode/extensions.md) file.

> [!WARNING]
> Nano-For-Windows will require you to replace the `<USERNAME>` in the `.nanorc` file with your Windows username. Nano also requires you to go to the `C:/users/<USERNAME>/scoop/apps/nano/current/` folder and copy the [syntax folder](/Windows/nano/syntax/) into it.

> [!WARNING]
> You will need to change the `codedir` and `gitcode` functions with their own paths like `E:/code/` for `codedir` and `E:/code/github/` for `gitcode` in the [Powershell PROFILE](/Windows/Powershell/PROFILE.ps1).

> [!TIP]
> Did you know that you can change the style of the oh-my-posh prefix in the [PROFILE.ps1 file](/Windows/Powershell/PROFILE.ps1)? See more about [built in themes here](https://ohmyposh.dev/docs/themes). Recommended theme URLS to use in the [PROFILE.ps1 file](/Windows/Powershell/PROFILE.ps1): `https://raw.githubusercontent.com/james-beans/mono-style/refs/heads/main/src/monostyle.omp.json` and `C:\Users\USERNAME_HERE\AppData\Local\Programs\oh-my-posh\themes\multiverse-neon.omp.json` (remember to change your Windows username to what it actually is for the second recommended url)

### - List of Files:
  - [Powershell PROFILE](/Windows/Powershell/PROFILE.ps1) use `notepad.exe $PROFILE` to open your `$PROFILE` file.
  - [Windows Terminal Settings (themes only)](/Windows/Terminal/settings.json) to find your Windows Terminal settings file, go to `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\` and open `settings.json`.

  - [.gitconfig](/Windows/Git/.gitconfig) to find your git config file, go to `%USERPROFILE%\` and open `.gitconfig`.

  - [VSCode Settings](/Windows/VSCode/settings.json) to find your VSCode settings file go to `%APPDATA%\Code\User\` and open `settings.json`.
  - [VSCode Extensions](/Windows/VSCode/extensions.md) a list of VSCode extensions with links to their websites that you will need to install for the VSCode settings file to work.

  - [Nano Config File](/Windows/nano/.nanorc) to find your Nano syntax file, go to `C:/users/<USERNAME>` and open the `.nanorc` file.
  - [Nano Syntax Folder](/Windows/nano/syntax) a folder of Nano syntax files that you will need to copy into the `C:/users/<USERNAME>/scoop/apps/nano/current/` folder.


<hr />

<div align="center"> 
  <a href="https://github.com/james-beans/Profile-Configs" target="_blank">
    <img src="https://custom-icon-badges.demolab.com/badge/Go-Home-1F222E?style=for-the-badge&color=black&logoColor=black&logo=home&labelColor=white" target="_blank" />
  </a>
  <a href="https://github.com/james-beans/Profile-Configs/blob/main/LICENSE" target="_blank">
    <img src="https://custom-icon-badges.demolab.com/badge/GNU-GPLV3-1F222E?style=for-the-badge&color=black&logoColor=black&logo=law&labelColor=white" target="_blank" />
  </a>
</div>
