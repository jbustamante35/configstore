# ConfigStore
Storing area for all of my configuration files for my laptops.
Configuration files are stored in either main or dots, where main contains configuration files for *bash*, *zsh*, and *vim*.
The dots folder contains dot files for every other program (including those in main), which are managed by the '*dotify*' Ruby program <https://rubygems.org/gems/dotify/versions/0.6.2>

The devices I'm currently tracking are:

| **Device** | **Description** | **Homebase** |
| :--- | :--- | :--- |
| WinryRockbell |  Main ASUS laptop | Spalding Lab |
| RinTohsaka | Dell laptop | Eagle Heights |
| Potato | Samsung Chromebook 3 | Portable laptop |
| JDev | Remote Desktop | Birge Hall Server Room |

## Usage
All configuration files are automatically saved into their respective device's directory every hour via a cron job that runs the **syncconfigs.sh** file included in this program's primary directory.

### Loading Profiles
Any device can load either the '*main*' or '*dots*' config files of another device with the **loadProfile.sh** script **[NOT YET FUNCTIONAL]**.

For example, __Potato__ can load the profile __RinTohsaka__ via:
```
bash loadProfile.sh rintohsaka main
```
This will save a backup of the *bash*, *zsh*, and *vim* config files and copy the respective version from __RinTohsaka__ into __Potato__'s home directory.
To revert back to __Potato__'s configuration, use the **revertProfile.sh** script from this program's main directory. Simply run the following command: **[NOT YET FUNCTIONAL]**
```
bash revertProfile.sh potato
```

### Selecting specific configuration files
The **dotlist.txt** and **mainlist.txt** files contain the list of dot files to load for the 'configs' parameter.
These files contain all the dot files to load from the '*main*' and '*dots*' folders and determine which configuration files to loadfrom those folders.
The user should comment out the items that should not be included during the loadProfile command, If nothing is commented out, then every configuration file from the desired profile is loaded into the respective device.


