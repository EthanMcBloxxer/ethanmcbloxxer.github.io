---
title: The Great GNULinux Migration
subtitle: How I migrated from Windows to Zorin
---

For some background, if you don't already know, [Zorin](https://zorinos.com/) is a GNULinux distribution which mainly focuses on making the user interface the most like other operating systems, which is perfect for me, since I could easily get adjusted without worrying too much about other components or GNOME customization (which I actually did on a previously secondary Ubuntu dualboot to clone Mac UI).

Surprisingly, none of this ended up mattering at all, since I completely changed the taskbar, and the actual window topbar is totally different from Windows.

![Topbar + Taskbar](https://user-images.githubusercontent.com/39684348/123530405-e3959880-d6c7-11eb-8474-b24293c85c18.png)

Luckily for me, I love the customization and placement. Now, the actual migration process for me was the most hair-pulling-out process I've ever gone through. And I'm not even using Arch Linux.

At the beginning, I had Windows and Ubuntu, with Windows on my NVMe card and Ubuntu on my SSD. Some time later, I decided it would be benificial to reset and [ameliorate](https://ameliorated.info/) my computer, so I did so.  
I deleted the Ubuntu partition at this time along with the current Windows one,  
reinstalled it,  
tried to ameliorate it,  
failed,  
reinstalled it,  
installed everything,  
decided I wanted to move to GNULinux,  
got an installer,  
formatted Windows,  
installed Zorin on the NVMe card,  
tried to install Windows on the SSD,  
which failed and overwrote my Zorin bootloader,  
tried to manually update GRUB,  
failed,  
got the bootloader stuck and made it boot before the keyboard turned on,  
needed to remove the NVMe card,  
installed Windows,  
which still overwrote the Zorin bootloader,  
backed up my virtual machines (Windows, Tails, Zorin),  
formatted both drives,  
installed Windows on the SSD,  
installed Zorin on the NVMe,  
reinstalled my virtual machines,  
ran `os-prober` multiple times,  
installed tons of Windows packages,  
restarted Windows multiple times,  
ran `os-prober`,

and finally, Zorin is on my bigger NVMe and Windows is on my SSD. Yeah, then I decided to use VirtualBox to boot to a logical drive (my SSD), so I never have to touch GRUB again. I now have two Windows virtual machines, one logical, one virtual and ameliorated. This is complicated.

Later, I ended up pressing <kbd>Control</kbd> + <kbd>Meta</kbd> + <kbd>F2</kbd> and getting into a terminal interface. I thought I uninstalled both X and GNOME somehow, so this entire process half repeated itself. Had to reinstall everything, and later figured out what I did and how I get back.

Fair warning, please don't do that. To get out of the terminal, just press <kbd>Control</kbd> + <kbd>Meta</kbd> + <kbd>F1</kbd>. Nice to know I can just *move to a terminal interface* though.
