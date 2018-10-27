# -*- coding: utf-8 -*-
# A customized config.py for Qtile window manager (http://www.qtile.org)     
# Modified by Derek Taylor (http://www.gitlab.com/dwt1/ )
#
# The following comments are the copyright and licensing information from the default config.
# Copyright (c) 2010 Aldo Cortesi, 2010, 2014 dequis, 2012 Randall Ma, 2012-2014 Tycho Andersen, 
# 2012 Craig Barnes, 2013 horsik, 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
# and associated documentation files (the "Software"), to deal in the Software without restriction, 
# including without limitation the rights to use, copy, modify, merge, publish, distribute, 
# sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial 
# portions of the Software.


##### IMPORTS #####

import os
import re
import socket
import subprocess
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.widget import Spacer

##### DEFINING SOME WINDOW FUNCTIONS #####

@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

##### LAUNCH APPS IN SPECIFIED GROUPS #####

def app_or_group(group, app):
    def f(qtile):
        if qtile.groupMap[group].windows:
            qtile.groupMap[group].cmd_toscreen()
        else:
            qtile.groupMap[group].cmd_toscreen()
            qtile.cmd_spawn(app)
    return f

##### KEYBINDINGS #####

def init_keys():
    keys = [
            Key(
                [mod], "Return", 
                lazy.spawn(myTerm)                        # Open terminal
                ),
            Key(
                [mod], "Tab", 
                lazy.next_layout()                        # Toggle through layouts
                ),
            Key(
                [mod, "shift"], "c", 
                lazy.window.kill()                        # Kill active window
                ),
            Key(
                [mod, "shift"], "r", 
                lazy.restart()                            # Restart Qtile
                ),
            Key(
                [mod, "shift"], "q", 
                lazy.shutdown()                           # Shutdown Qtile
                ),
            Key([mod], "i",
                lazy.to_screen(2)                         # Keyboard focus screen(0)
                ),
            Key([mod], "o",
                lazy.to_screen(0)                         # Keyboard focus screen(1)
                ),
            Key([mod], "p",
                lazy.to_screen(1)                         # Keyboard focus screen(2)
                ),
            # Window controls
            Key(
                [mod], "k", 
                lazy.layout.down()                        # Switch between windows in current stack pane
                ),
            Key(
                [mod], "j", 
                lazy.layout.up()                          # Switch between windows in current stack pane
                ),
            Key(
                [mod, "shift"], "k", 
                lazy.layout.shuffle_down()                # Move windows down in current stack
                ),
            Key(
                [mod, "shift"], "j", 
                lazy.layout.shuffle_up()                  # Move windows up in current stack
                ),
            Key(
                [mod, "shift"], "l", 
                lazy.layout.grow(),                       # Grow size of current window (XmonadTall)
                lazy.layout.increase_nmaster(),           # Increase number in master pane (Tile)
                ),
            Key(
                [mod, "shift"], "h", 
                lazy.layout.shrink(),                     # Shrink size of current window (XmonadTall)
                lazy.layout.decrease_nmaster(),           # Decrease number in master pane (Tile)
                ),
            Key(
                [mod, "shift"], "Left",                   # Move window to workspace to the left
                window_to_prev_group
                ),
            Key(
                [mod, "shift"], "Right",                  # Move window to workspace to the right
                window_to_next_group
                ),
            Key(
                [mod], "n", 
                lazy.layout.normalize()                   # Restore all windows to default size ratios 
                ),
            Key(
                [mod], "m", 
                lazy.layout.maximize()                    # Toggle a window between minimum and maximum sizes
                ),
                
            Key(
                [mod, "shift"], "KP_Enter", 
                lazy.window.toggle_floating()             # Toggle floating
                ),
            Key(
                [mod, "shift"], "space", 
                lazy.layout.rotate(),                     # Swap panes of split stack (Stack)
                lazy.layout.flip()                        # Switch which side main pane occupies (XmonadTall)
                ),
            # Stack controls
            Key(
                [mod], "space", 
                lazy.layout.next()                        # Switch window focus to other pane(s) of stack
                ),
            Key(
                [mod, "control"], "Return", 
                lazy.layout.toggle_split()                # Toggle between split and unsplit sides of stack
                ),
            # GUI Apps

            Key(
                [mod], "w", 
                lazy.function(app_or_group("WWW", "google-chrome-beta"))
                ),
            Key(
                [mod], "f", 
                lazy.spawn("pcmanfm")
                ),
            Key(
                [mod], "g", 
                lazy.spawn("geany")
                ),
            # Apps Launched with <SUPER> + <KEYPAD 0-9>
            Key(
                [mod], "KP_Insert",                                  # Keypad 0
                # lazy.spawncmd()                                    # Qtile Run Dialog
                lazy.spawn("rofi -show run")
                ),
            Key(
                [mod], "KP_End",                                     # Keypad 1
                lazy.spawn(myTerm+" -e lynx -cfg=~/.lynx.cfg http://www.distrowatch.com")
                # lazy.spawn(myTerm+" -e lynx -cfg=~/.lynx.cfg -lss=~/.lynx.lss http://www.distrowatch.com")
                ),
            Key(
                [mod], "KP_Down",                                    # Keypad 2
                lazy.spawn(myTerm+" -e sh ./scripts/googler-script.sh")
                ),
            Key(
                [mod], "KP_Page_Down",                               # Keypad 3
                lazy.spawn(myTerm+" -e newsboat") 
                ), 
            Key(
                [mod], "KP_Left",                                    # Keypad 4
                lazy.spawn(myTerm+" -e rtv")
                ),
            Key(
                [mod], "KP_Begin",                                   # Keypad 5
                lazy.spawn(myTerm+" -e neomutt")
                ), 
            Key(
                [mod], "KP_Right",                                   # Keypad 6
                lazy.spawn(myTerm+" -e twitch-curses")
                ),
            Key(
                [mod], "KP_Home",                                    # Keypad 7
                lazy.spawn(myTerm+" -e sh ./scripts/haxor-news.sh")
                ),
            Key(
                [mod], "KP_Up",                                      # Keypad 8
                lazy.spawn(myTerm+" -e sh ./scripts/toot.sh")
                ),
            Key(
                [mod], "KP_Page_Up",                                 # Keypad 9
                lazy.spawn(myTerm+" -e sh ./scripts/tig-script.sh")
                ),
            # Apps Launched with <SUPER> + <SHIFT> + <KEYPAD 0-9>
            Key(
                [mod, "shift"], "KP_End",                            # Keypad 1
                lazy.spawn(myTerm+" -e ranger")
                ),
            Key(
                [mod, "shift"], "KP_Down",                           # Keypad 2
                lazy.spawn(myTerm+" -e htop")
                ),
            Key(
                [mod, "shift"], "KP_Page_Down",                      # Keypad 3
                lazy.spawn(myTerm+" -e cmus") 
                ),
            Key(
                [mod, "shift"], "KP_Left",                           # Keypad 4
                lazy.spawn(myTerm+" -e irssi")
                ),
            Key(
                [mod, "shift"], "KP_Begin",                          # Keypad 5
                lazy.spawn(myTerm+" -e rtorrent")
                ), 
            Key(
                [mod, "shift"], "KP_Right",                          # Keypad 6
                lazy.spawn(myTerm+" -e youtube-viewer")
                ),
            Key(
                [mod, "shift"], "KP_Home",                           # Keypad 7
                lazy.spawn(myTerm+" -e alsamixer")
                ),
            Key(
                [mod, "shift"], "KP_Up",                             # Keypad 8
                lazy.spawn(myTerm+" -e calcurse")
                ),
            Key(
                [mod, "shift"], "KP_Page_Up",                        # Keypad 9
                lazy.spawn(myTerm+" -e vim /home/dt/.config/qtile/config.py")
                ),
            # Apps Launched with <SUPER> + <CONTROL> + <KEYPAD 0-9>
            Key(
                [mod, "control"], "KP_End",                            # Keypad 1
                lazy.spawn(myTerm+" -e htop")
                ),
            Key(
                [mod, "control"], "KP_Down",                           # Keypad 2
                lazy.spawn(myTerm+" -e glances")
                ),
            Key(
                [mod, "control"], "KP_Page_Down",                      # Keypad 3
                lazy.spawn(myTerm+" -e nmon") 
                ),
            Key(
                [mod, "control"], "KP_Left",                           # Keypad 4
                lazy.spawn(myTerm+" -e httping -KY --draw-phase localhost")
                ),
            Key(
                [mod, "control"], "KP_Begin",                          # Keypad 5
                lazy.spawn(myTerm+" -e s-tui")
                ), 
            Key(
                [mod, "control"], "KP_Right",                          # Keypad 6
                lazy.spawn(myTerm+" -e sh ./scripts/pianobar.sh")
                ),
            Key(
                [mod, "control"], "KP_Home",                           # Keypad 7
                lazy.spawn(myTerm+" -e alsamixer")
                ),
            Key(
                [mod, "control"], "KP_Up",                             # Keypad 8
                lazy.spawn(myTerm+"-e calcurse")
                ),
            Key(
                [mod, "control"], "KP_Page_Up",                        # Keypad 9
                lazy.spawn(myTerm+" -e wopr report.xml")
                ),
        ]
    return keys


##### BAR COLORS #####

def init_colors():
    return [["#2b303b", "#2b303b"], # panel background
            ["#40444D", "#424A5B"], # background for current screen tab
            ["#C0C5CE", "#C0C5CE"], # font color for group names
            ["#B48EAD", "#B48EAD"], # background color for layout widget
            ["#65737E", "#65737E"], # background for other screen tabs
            ["#859900", "#859900"], # dark green gradiant for other screen tabs
            ["#BF616A", "#BF616A"], # background color for network widget
            ["#A3BE8C", "#A3BE8C"], # background color for pacman widget
            ["#8fa1b3", "#8fa1b3"], # background color for cmus widget
            ["#ebcb8b", "#ebcb8b"]] # background color for clock widget

##### GROUPS #####
    
def init_group_names():
    return [("DEV", {'layout': 'max'}),
            ("WWW", {'layout': 'max'}),
            ("SYS", {'layout': 'monadtall'}),
            ("DOC", {'layout': 'monadtall'}),
            ("VBOX", {'layout': 'floating'}),
            ("CHAT", {'layout': 'tile'}),
            ("MEDIA", {'layout': 'tile'}),
            ("GFX", {'layout': 'floating'})]
           
def init_groups():
    return [Group(name, **kwargs) for name, kwargs in group_names]


##### LAYOUTS #####

def init_floating_layout():
    return layout.Floating(border_focus="#3B4022")
    
def init_layout_theme():
    return {"border_width": 2,
            "margin": 3,
            "border_focus": "60C307",
            "border_normal": "0F2E35"
		    }
		    
def init_border_args():
    return {"border_width": 2}

def init_layouts():
    return [layout.Max(**layout_theme),
            layout.MonadTall(**layout_theme),
            layout.Stack(stacks=2, **layout_theme),
            layout.RatioTile(**layout_theme),
            layout.Tile(shift_windows=True, **layout_theme),
            layout.TreeTab(
                font = "Ubuntu",
                fontsize = 10, 
                sections = ["FIRST", "SECOND"],
                section_fontsize = 11, 
                bg_color = "141414", 
                active_bg = "90C435", 
                active_fg = "000000", 
                inactive_bg = "384323", 
                inactive_fg = "a0a0a0", 
                padding_y = 5,
                section_top = 10,
                panel_width = 320,
                **layout_theme
                ),
            layout.Slice(side="left", width=192, name="gimp", role="gimp-toolbox",
                fallback=layout.Slice(side="right", width=256, role="gimp-dock",
                fallback=layout.Stack(num_stacks=1, **border_args))),
            layout.Floating(**layout_theme)]
            #layout.Matrix(**layout_theme),
            #layout.Zoomy(**layout_theme),


##### WIDGETS #####

def init_widgets_defaults():
    return dict(font="Ubuntu Mono",
                fontsize = 10,
                padding = 2,
                background=colors[2])

def init_widgets_list():
    prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
    widgets_list = [
               widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[2], 
                        background = colors[0]
                        ),
               widget.GroupBox(font="Ubuntu Bold",
                        fontsize = 9,
                        margin_y = 0, 
                        margin_x = 0, 
                        padding_y = 9, 
                        padding_x = 5, 
                        borderwidth = 1, 
                        active = colors[2], 
                        inactive = colors[2],
                        rounded = False,
                        highlight_method = "block",
                        this_current_screen_border = colors[6],
                        this_screen_border = colors [4],
                        other_current_screen_border = colors[0],
                        other_screen_border = colors[0],
                        foreground = colors[2], 
                        background = colors[0]
                        ), 
               widget.Prompt(
                        prompt=prompt, 
                        font="Ubuntu Mono",
                        padding=10, 
                        foreground = colors[3],
                        background = colors[1]
                        ),
               widget.Sep(
                        linewidth = 0,
                        padding = 10,
                        foreground = colors[2], 
                        background = colors[0]
                        ),
               widget.WindowName(font="Ubuntu",
                        fontsize = 11,
                        foreground = colors[5], 
                        background = colors[0],
                        padding = 6
                        ),
               widget.Image(
                        scale = True,
                        filename = "~/.config/qtile/bar06.png",
                        background = colors[6]
                        ),
               widget.Systray(
                        background=colors[1]
                        ),
               widget.Image(
                        scale = True,
                        filename = "~/.config/qtile/bar02-b.png",
                        background = colors[6]
                        ),
               widget.TextBox(
                        text=" ↯", 
                        foreground=colors[0], 
                        background=colors[6],
                        padding = 0,
                        fontsize=14
                        ),
               widget.Net(
                        interface = "enp3s0", 
                        foreground = colors[0], 
                        background = colors[6]
                        ),
               widget.Image(
                        scale = True,
                        filename = "~/.config/qtile/bar03.png",
                        background = colors[3]
                        ),
               widget.TextBox(
                        font="Ubuntu Bold",
                        text=" ☵", 
                        padding = 6,
                        foreground=colors[0], 
                        background=colors[3],
                        fontsize=14
		                ),
               widget.CurrentLayout(
                        foreground = colors[0], 
                        background = colors[3]
                        ),
               widget.Image(
                        scale = True,
                        filename = "~/.config/qtile/bar04.png",
                        background = colors[7]
                        ),
               widget.TextBox(
                        font="Ubuntu Bold",
                        text=" ⟳", 
                        padding = 6,
                        foreground=colors[0], 
                        background=colors[7],
                        fontsize=14
		                ),
               widget.Pacman(
                        execute = "urxvtc",
                        update_interval = 1800,
                        foreground = colors[0], 
                        background = colors[7]
                        ),
               widget.TextBox(
                        text="Updates", 
                        padding = 6,
                        foreground=colors[0], 
                        background=colors[7]
		                ),
               widget.Image(
                        scale = True,
                        filename = "~/.config/qtile/bar05.png",
                        background = colors[8]
                        ),
               widget.TextBox(
                        font="Ubuntu Bold",
                        text=" ♫", 
                        padding = 6,
                        foreground=colors[0], 
                        background=colors[8],
                        fontsize=14
		                ),
               widget.Cmus(
                        max_chars = 40,
                        update_interval = 0.5,
                        foreground = colors[0], 
                        background = colors[8]
                        ),
               widget.Image(
                        scale = True,
                        filename = "~/.config/qtile/bar07.png",
                        background = colors[9]
                        ),
               widget.TextBox(
                        font="Ubuntu Bold",
                        text=" 🕒", 
                        foreground=colors[0],
                        background=colors[9], 
                        padding = 6,
                        fontsize=14
                        ),
               widget.Clock(
                        foreground = colors[0], 
                        background = colors[9],
                        format="%A, %B %d - %H:%M"
                        ),
               widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[0], 
                        background = colors[9]
                        ),
              ]       
    return widgets_list


##### SCREENS ##### (TRIPLE MONITOR SETUP)

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1                       # Slicing removes unwanted widgets on Monitors 1,3
    
def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2                       # Monitor 2 will display all widgets in widgets_list
    
def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), size=25)), 
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), size=25)), 
            Screen(top=bar.Bar(widgets=init_widgets_screen1(), size=25))]


##### FLOATING WINDOWS #####

@hook.subscribe.client_new
def floating(window):
    floating_types = ['notification', 'toolbar', 'splash', 'dialog']
    transient = window.window.get_wm_transient_for()
    if window.window.get_wm_type() in floating_types or transient:
        window.floating = True

def init_mouse():
    return [Drag([mod], "Button1", lazy.window.set_position_floating(),      # Move floating windows
                 start=lazy.window.get_position()),
            Drag([mod], "Button3", lazy.window.set_size_floating(),          # Resize floating windows
                 start=lazy.window.get_size()),
            Click([mod, "shift"], "Button1", lazy.window.bring_to_front())]  # Bring floating window to front

##### DEFINING A FEW THINGS #####
if __name__ in ["config", "__main__"]:
    mod = "mod4"                                         # Sets mod key to SUPER/WINDOWS
    #myTerm = "urxvtc"                                    # My terminal of choice
    myTerm = "gnome-terminal --profile=Nayru"                                    # My terminal of choice
    myConfig = "/home/dt/.config/qtile/config.py"        # Qtile config file location 

    colors = init_colors()
    keys = init_keys()
    mouse = init_mouse()
    group_names = init_group_names()
    groups = init_groups()
    floating_layout = init_floating_layout()
    layout_theme = init_layout_theme()
    border_args = init_border_args()
    layouts = init_layouts()
    screens = init_screens()
    widget_defaults = init_widgets_defaults()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()

##### SETS GROUPS KEYBINDINGS #####
for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))          # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))   # Send current window to another group
                        
##### STARTUP APPLICATIONS #####
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

##### NEEDED FOR SOME JAVA APPS #####

#wmname = "LG3D"
wmname = "qtile"
