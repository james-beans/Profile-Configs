# Windows Config

<br />

> [!TIP]
> I use Windows 11. This setup will not work for all versions of Windows. Anything later than Windows 10 I wouldn't recommend even trying to run this setup on.

> [!TIP]
> Run all of these commands to install from an administrator Powershell window.

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

> [!WARNING]
> The VSCode settings file will require you to install a list of extensions and manually change the `zig.zls.path` to the path of your Zig compiler executable. The extensions you need are listed with links in the [extensions list](/Windows/VSCode/extensions.md) file.

> [!WARNING]
> Nano-For-Windows will require you to replace the `<USERNAME>` in the `.nanorc` file with your Windows username. Nano also requires you to go to the `C:/users/<USERNAME>/scoop/apps/nano/current/` folder and copy the [syntax folder](/Windows/nano/syntax/) into it.

### - List of Files:
  - [Powershell PROFILE](/Windows/Powershell/PROFILE.json) use `notepad.exe $PROFILE` to open your `$PROFILE` file.
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