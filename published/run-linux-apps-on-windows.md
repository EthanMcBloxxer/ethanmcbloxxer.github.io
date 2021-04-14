---
layout: post
title: 
subtitle: 
thumbnail-img: assets/img/posts/thumb/gedit.png
cover-img: assets/img/posts/cover/ubuntu-console.png
tags: [windows, linux]
---

# Run Linux GUI Applications on Windows 10
*Using WSL, Ubuntu, and VcXsrv to open Linux programs*  
*Created on January 25th, 2021*

With Windows Subsystem for Linux, you can now run "Linux" on top of Windows. You can get certain distributions from the Microsoft Store, like Ubuntu, Debian, Kali, OpenSUSE (Server), and Fedora. You can also use PowerShell or curl to download them. Before anything, though, you need to make sure that you have WSL enabled.

## Enabling WSL
The simplest way to go checking that you have WSL installed is to type in `cmd` into Start, then type `wsl`. If the default Windows `C:\Users\admin>` turns into `root@PC:/mnt/c/Users/admin#`, then you have WSL installed. If this isn't the case, you'll need to open Windows Features. You can either search "Turn Windows features on or off" in Start or open Run with Win+R and type "OptionalFeatures". Make sure you can use administrator permissions, because this requires it.

![Run OptionalFeatures](/assets/img/embed/run-optionalfeatures.png)

Then, check "Windows Subsystem for Linux". Click OK and restart if prompted. Now, you can use WSL. Alternatively, without using OptionalFeatures, you can open PowerShell (as Administrator) and use this command:

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

If you couldn't use that strategy, you could also type `wsl --install` into `cmd`.

### Downloading A Distribution
Microsoft has made a collection of official distributions that can run on WSL at [aka.ms/wslstore](https://aka.ms/wslstore), so pick one you like. If you don't have much experience with Linux, choose Ubuntu. The rest of the tutorial will be written mainly for the Ubuntu distribution, but the same should apply for all other distributions.

### Ensuring WSL is on Version 1
We have to now make sure that Windows is running the distribution at WSL version 1 for compatibility. Open `cmd` through Start again, and type in `wsl -l -v`. If you see your distribution at version 1, then you're good to go. Otherwise, type `wsl --set-version Ubuntu 1` (if you didn't use Ubuntu, make sure you replace Ubuntu with the name of your distribution as shown in `wsl -l -v`!). This should hopefully set the version to 1, but you can always see Microsoft docs if this didn't cover an issue.

## Using WSL
If all went well, you can open your newly downloaded distribution (this will take a minute or two the first time you launch it). Ubuntu will prompt you for a UNIX username and password, and you'll be ready to use the WSL Ubuntu console. Next, we'll install software to show `apt-get` apps on your computer.

## Installing and using Linux Programs
You've successfully installed your distribution and are ready to start hosting Linux apps on your computer. You'll need to download [VcXsrv](https://sourceforge.net/projects/vcxsrv/files/latest/download) [(source)](https://github.com/ArcticaProject/vcxsrv). Make sure you leave every setting on install as default. Once installed, you can launch XLaunch from your desktop or start menu. Press Next until Finish appears, then click Finish (make sure you leave all settings default!). VcXsrv will now stay in your taskbar tray unless you exit it (which is a good idea when you're done). To integrate this with your distribution, open it and type

```sh
export DISPLAY=:0
```

which will sync the display of the distribution with that of the virtual display (VcXsrv).


Finally, you can `apt install` whatever program you'd like. To start a test, you can run `apt install gedit`, then `gedit` to open gEdit on Windows.

<p class="box-note">Like Ubuntu, all processes launched and running from the terminal will quit when you close the terminal. The terminal will also be rendered unusable until the process is terminated. You can open multiple console windows, though another good alternative to doing this that ports the tabbing system of Ubuntu's console would be <a href="www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701">Windows Terminal</a> (which is officially made by Windows).</p>
