# ConfigStore
Storage area for dotfiles and configuration files for all of my devices.
Files are stored in either __*main*__ or __*dots*__ directories.

The __*main*__ directory contains configuration files for *bash*, *zsh*, and *vim*.

The __*dots*__ folder contains dotfiles for every other program (including those in __*main*__ ), which are
managed by the '*dotify*' Ruby program <https://rubygems.org/gems/dotify/versions/0.6.2>

The devices I'm currently tracking are:

| **Device**    | **Description**      | **OS**                | **Homebase**           |
| :---          | :---                 | :---                  | :---                   |
| WinryRockbell | Main ASUS laptop     | Manjaro 18.0.4        | Spalding Lab           |
| RinTohsaka    | Dell laptop          | Arch                  | Eagle Heights          |
| Archer (dead) | Dell laptop          | Arch                  | Eagle Heights          |
| JDev          | Remote Desktop       | Scientific Linux 6.10 | Birge Hall Server Room |
| Potato        | Samsung Chromebook 3 | Gallium OS            | Portable laptop        |
| Aqua (dead)   | Samsung Chromebook 3 | Android 7.1.1         | Portable laptop        |
| Megatron      | ACER laptop          | Arch                  | Sunshine Drive         |

## Usage
All configuration files are automatically saved into their respective device's directory every
hour via a cron job that runs the **syncconfigs.sh** file in this program's primary directory.

The syncconfigs.sh script requires the \$PROFILE environment variable to be set to the device name.
The \$PROFILE variable can either be set manually, or set in that devices startup script (e.g.
.bashrc, .zshrc, .profile, etc.).

The syncconfigs.sh script will create a new directory in the ConfigStore repository if the
profile is not recognized.

### Creating Profiles
To create a new profile, just add this line to your startup script:
```
export PROFILE=devicename
```

The device must have the ruby program '*dotify*' installed and set up on the new device, otherwise
only the __*main*__ directory will be synchronized.

As of now, I have not implemented an automated means for removing large directories and files,
or of creating or removing git submodules (see Notes/TODO below).
I am currently removing these manually before pushing a new commit.

### Loading Profiles
Any device can load either the '*main*' or '*dots*' config files of another device with the
**loadProfile.sh** script **[NOT YET FUNCTIONAL]**.

For example, __Potato__ can load the profile __RinTohsaka__ via:
```
bash loadProfile.sh rintohsaka main
```
This will save a backup of the *bash*, *zsh*, and *vim* config files and copy the respective
version from __RinTohsaka__ into __Potato__'s home directory.

To revert back to __Potato__'s configuration, use the **revertProfile.sh** script from this
program's main directory. Simply run the following command: **[NOT YET FUNCTIONAL]**
```
bash revertProfile.sh potato
```

### Selecting specific configuration files
The **dotlist.txt** and **mainlist.txt** files contain the list of dot files to load for
the 'configs' parameter.

These files contain all the dot files to load from the '*main*' and '*dots*' folders and determine
which configuration files to loadfrom those folders.

The user should comment out the items that should not be included during the loadProfile command,
If nothing is commented out, then every configuration file from the desired profile is loaded
into the respective device.

## Notes / TODO
- Some applications place unwanted files, files with symbolic links, large files, or files with
sensitive data in the .configs directory. This .configs directory contains many helpful dotfiles,
such as those for i3wm, dunst, conky, etc. among others.
I currently have to remove these manually, as 'dotify' is unable to remove subdirectories.
    - I need to add a script that removes these files after syncing to the repo. This can either
    be during the rsync, where each file is matched to a manifest for unwanted files, or
    simply removed from the repo after syncing [ probably faster? ].

- The loadProfile.sh and revertProfile.sh still do nothing.
    - I still haven't added functionality for loading profiles or reverting profiles.

- As of 10/27/2018, this whole repo was nuked [ I cleared the entire repo then deleted everything
in it's history that was >10kb. Then one-by-one, I rebuilt each branch and synchronized each of
my devices, ensuring that no files >5MB are added into the repo.
    - Total size reduction was ~600MB at maximum down to just ~7MB after The Purge.

