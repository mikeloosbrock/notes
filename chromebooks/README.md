## Crouton Installation

1. Enable developer mode on the chromebook.

   On my Samsung Chromebook:
   * Press and hold **ESC+REFRESH+POWER**.
   * Press **CTL+D** when prompted that Chrome OS is missing or damaged.
   * Press **ENTER** when prompted to turn OS verification off.
   * The chromebook will reboot. Press **CTL+D** when prompted that OS verification is off.
   * Wait while the system transitions to developer mode.
   * The chromebook will reboot. Press **CTL+D** when prompted that OS verification is off.

   Important Notes:
   * Enabling/disabling developer mode _erases all data on the chromebook!!!_
   * When in developer mode, you must press **CTL+D** on every reboot.
   * If you screw up the **CTL+D** mentioned above, you may disable developer mode (and erase your data).

2. Install the Crouton Chrome extension: https://goo.gl/OVQOEt

3. Download Crouton: https://goo.gl/fd3zc

## Customize Crouton

1. Launch the ChromeOS Developer Shell (crosh) in a new Chrome tab by pressing **CTL+ALT+T**.
  
2. In the crosh shell, run these commands:
   ```crosh> shell
   chronos@localhost /$ cd
   chronos@localhost ~$ vi .bashrc
   ```

3. Add these aliases to ~/.bashrc:

   ```alias crouton="sudo sh ~/Downloads/crouton"    # crouton shortcut
   alias chroots="sudo edit-chroot -al"           # list all chroots and their properties
   alias edit-chroot="sudo edit-chroot"           # edit a chroot (pass chroot name as first arg) 
   alias lxde="sudo startlxde -b -X xiwi"         # launch lxde desktop in xiwi mode
   alias lxde-xorg="sudo startlxde -b -X xorg"    # launch lxde desktop in xorg mode (for opengl support and minecraft)
   alias xiwi="sudo startxiwi -b -T"              # run an application in a chrome tab (pass app name as first arg)
   alias lxterm="sudo startxiwi -b -T lxterminal" # run lxterminal in a chrome tab
   alias keepassx="sudo startxiwi -b -T keepassx" # run keepassx in a chrome tab
   ```

4. Activate the aliases added above:

   ```chronos@localhost ~$ . ~/.bashrc
   ```
## Chroot Installation

1. Install an Ubuntu LXDE chroot:

   (The Ubuntu release is specified with -r.)
   ```chronos@localhost ~$ crouton -n lxde -r xenial -t lxde,extension,keyboard,xiwi,xorg
   ```

2. Launch a terminal in the chroot:

   (This uses an alias created above, and launches the terminal in a new Chrome tab.)
   ```chronos@localhost ~$ lxterm
   ```

3. In the chroot terminal launched above, fix a weird logout issue in LXDE:

   ```(lxde)user@localhost:~$ sudo apt-get install lxsession-logout
   ```

4. In the chroot, enable network servers by adding the following lines to /etc/rc.local:

   ```(lxde)user@localhost:~$ sudo /sbin/iptables -I INPUT -p tcp --dport 22    -j ACCEPT # SSH
   (lxde)user@localhost:~$ sudo /sbin/iptables -I INPUT -p tcp --dport 25565 -j ACCEPT # Minecraft
   (lxde)user@localhost:~$ sudo /sbin/iptables -I INPUT -p udp --dport 25565 -j ACCEPT # Minecraft
   ```
