---
title: EthanMcBloxxer's Random Filesystem Spec
subtitle: Name subject to change
---

I, personally, feel like no operating system has implemented a great file structure. \*nixes are my favorite, as they make `/` a much more sacred space than Windows, where an app like Ruby has to install to the root since it doesn't well understand spaced folders (or something like that), or Mac, where there barely even *is* a `/` (though system drives seem to inherit a simpler \*nix/BSD-like root)

Even with this said, I'm not about to invent the best filesystem ever that everyone should transition to, and that's kind of impossible at this point anyways.

To begin with, I love half of the \*nix file structure. `bin` makes sense, so does `boot`, `dev`, `home`, `srv`, and `tmp`. I don't get the other ones. Why is there `cdrom` if `dev` already exists? Just make `cd#p#` or `cr#p#` or `cdrom#p#`!

The lengths here are also odd, although I'm certain there's a reason for these. Why is `dev` not `device` if there are *much* longer names here too? What about `mnt`? `srv`? What is with the random abbriveations? Why are there subdirectories that inherit from `/` and have symlinks in different places?

So, with all this, I'm going to reinvent the file system, like \*nix does it.


* `binary`  
  Binary files, basically a combination of `/bin`, `/sbin`, and `/usr/bin`. Implementations may choose whether or not to seperate `/usr/bin/`. (This ambiguity may be changed.)

* `boot`  
  Boot files, copy of how this is already handled.

* `device`  
  Another copy but renamed from `dev` to `device`. Cases which use `cdrom` use this directory and are internal symlinks using the `cdrom` prefix (`cdrom#`).

* `home`  
  Near exact copy. `root` is moved here but is "hidden" by default. `~` is still an abbriviation for the active user's home directory.
    * `Settings`  
      Directory containing all user-specific settings configuration, like WiFi, Sound, Display Orienation, Mouse Speed, and more.
    * `Templates`  
      Store all files createable through the "New" shell dialog. Command line applications may also use this.
    * `Documents/Repositories`  
      A user-created directory which takes on the "[and repositories for version control systems](https://wikipedia.org/wiki/Filesystem_Hierarchy_Standard)" part of `/srv`

* `mount`  
  Copy of `mnt`.

* `package`  
  Similar to the Windows way of handling programs, stuff all the required files of a program into the same directory (the escaped package name) for relativity.

* `server`  
  Copy of `srv`. Semantically contains lowercase names of packages (`sql`, `mumble`), though this should not be forced by the system (for things like `http`, `ftp`, etc).

* `system`  
  The operating system files, kernel, etc. along with their respective configuration, inside their respective directories (like `ul` or `userland`, `kernel`, `driver`, etc). Some exceptions can be made for very important files to the system (windowing systems, desktop environments, etc).

* `temporary`  
  Copy of `tmp`.
    * `trash`  
    Container of items which are held for deletion confirmation.

Any of these can be shortened for 8.3 filename compatibility (or for other reasons). Minimal use of plurals is implemented to mimic how \*nix seems.

For all I know, this may be fundamentally flawed. I'm not the most experienced in the best way to implement a new file system. Edit this and pull request on GitHub or drop me an email at <ethanmcbloxxer@protonmail.com> if you have any (probably very necessary) alterations or ideas. Open to learning about this topic.
