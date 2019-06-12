-------------------------------------------------------------------------------
--                ___
--               /   |_      _____  _________  ____ ___  ___
--              / /| | | /| / / _ \/ ___/ __ \/ __ `__ \/ _ \
--             / ___ | |/ |/ /  __(__  ) /_/ / / / / / /  __/
--            /_/  |_|__/|__/\___/____/\____/_/ /_/ /_/\___/
--
-------------------------------------------------------------------------------
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty       = require("naughty")
local menubar       = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-------------------------------------------------------------------------------
------------------------------- Error Handling --------------------------------
-------------------------------------------------------------------------------
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-------------------------------------------------------------------------------
---------------------------------- Variables ----------------------------------
-------------------------------------------------------------------------------
-- Themes define colours, icons, font and wallpapers.
beautiful.init("/home/jbustamante/.config/awesome/xresources/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal   = "urxvt"
editor     = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
termapp    = terminal .. " -e "
browser    = os.getenv("BROWSER") or "qutebrowser"
walend     = os.getenv("WALEND") or " schemer "
walsat     = " 1 "
driver     = "nvidia"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
altkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile.left,
    awful.layout.suit.max,
    awful.layout.suit.fair,
    awful.layout.suit.spiral,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.floating,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.tile,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-------------------------------------------------------------------------------
------------------------------------ Menu -------------------------------------
-------------------------------------------------------------------------------
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys"    , function() hotkeys_popup.show_help(nil , awful.screen.focused()) end } ,
   { "manual"     , terminal .. " -e man awesome" }        ,
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart"    , awesome.restart }                      ,
   { "quit"       , function() awesome.quit() end }        ,
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal },
                                    { "open browser", browser }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu  = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-------------------------------------------------------------------------------
------------------------------------ Wibar ------------------------------------
-------------------------------------------------------------------------------
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({ }, 1,
        function(t)
            t:view_only()
        end),

    awful.button({ modkey }, 1,
        function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end),

    awful.button({ }, 3,
        awful.tag.viewtoggle),

    awful.button({ modkey }, 3,
        function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end),

    awful.button({ }, 4,
        function(t)
            awful.tag.viewnext(t.screen)
        end),

    awful.button({ }, 5,
        function(t)
            awful.tag.viewprev(t.screen)
        end)
)

local tasklist_buttons = gears.table.join(
    awful.button({ }, 1,
        function (c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal(
                    "request::activate",
                    "tasklist",
                    {raise = true}
                )
            end
        end),

    awful.button({ }, 3,
        function()
            awful.menu.client_list({ theme = { width = 250 } })
        end),

    awful.button({ }, 4,
        function ()
            awful.client.focus.byidx(1)
        end),

    awful.button({ }, 5,
        function ()
            awful.client.focus.byidx(-1)
        end)
)

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(
function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "01", "02", "03", "04", "05", "06", "07", "08", "09" },
        s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1,
                               function ()
                                   awful.layout.inc( 1)
                               end),

                           awful.button({ }, 3,
                               function ()
                                   awful.layout.inc(-1)
                               end),

                           awful.button({ }, 4,
                               function ()
                                   awful.layout.inc( 1)
                               end),

                           awful.button({ }, 5,
                               function ()
                                   awful.layout.inc(-1)
                               end))
    )

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        {
            -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },

            -- Middle widgets
            s.mytasklist,

        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
end)
-- }}}

-------------------------------------------------------------------------------
------------------------------- Mouse bindings --------------------------------
-------------------------------------------------------------------------------
root.buttons(gears.table.join(
    awful.button({ }, 3,
        function ()
            mymainmenu:toggle()
        end),

    awful.button({ }, 4,
        awful.tag.viewnext),

    awful.button({ }, 5,
        awful.tag.viewprev)
))
-- }}}

-------------------------------------------------------------------------------
-------------------------------- Key bindings ---------------------------------
-------------------------------------------------------------------------------
globalkeys = gears.table.join(
-------------------------------- Help Programs --------------------------------
    awful.key({ modkey,           }, "s",
        hotkeys_popup.show_help,
        {description="show help", group = "awesome"}),

    awful.key({ "Control", "Shift" }, "d",
        function ()
            mymainmenu:show()
        end,
        {description = "show main menu", group = "awesome"}),

    awful.key({ modkey, "Shift" }, "c",
        awesome.restart,
        {description = "reload awesome", group = "awesome"}),

    awful.key({ "Control", altkey }, "Delete",
        awesome.quit,
        {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey }, "x",
        function ()
            awful.prompt.run {
              prompt       = "Run Lua code: ",
              textbox      = awful.screen.focused().mypromptbox.widget,
              exe_callback = awful.util.eval,
              history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        {description = "lua execute prompt", group = "awesome"}),

    awful.key({ altkey }, "Delete",
        function ()
            awful.util.spawn("i3shutdown")
        end,
        {description = "Shutdown selection rofi", group = "launcher"}),

    awful.key({ modkey, "Shift" }, "p",
        function ()
            awful.util.spawn("lockScreen" .. " end")
            --awful.util.spawn("xscreensaver-command" .. " -lock")
        end,
        {description = "Lock screen with XScreensaver", group = "launcher"}),


-------------------------------- Client Focus ---------------------------------
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}),

    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}),

    awful.key({ modkey, "Shift"   }, "j",
        function ()
            awful.client.swap.byidx(  1)
        end,
        {description = "swap with next client by index", group = "client"}),

    awful.key({ modkey, "Shift"   }, "k",
        function ()
            awful.client.swap.byidx( -1)
        end,
        {description = "swap with previous client by index", group = "client"}),

    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    awful.key({ modkey,           }, "u",
        awful.client.urgent.jumpto,
        {description = "jump to urgent client", group = "client"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

------------------------------- Screen Control --------------------------------
    awful.key({ modkey }, "e",
        function ()
            awful.screen.focus_relative( 1)
        end,
        {description = "focus the next screen", group = "screen"}),

    awful.key({ altkey }, "e",
        function ()
            awful.screen.focus_relative(-1)
        end,
        {description = "focus the previous screen", group = "screen"}),

------------------------------- Tag Navigation --------------------------------
    awful.key({ modkey,           }, "l",
        function ()
            awful.tag.incmwfact( 0.05)
        end,
        {description = "increase master width factor", group = "layout"}),

    awful.key({ modkey,           }, "h",
        function ()
            awful.tag.incmwfact(-0.05)
        end,
        {description = "decrease master width factor", group = "layout"}),

    awful.key({ modkey, "Control" }, "h",
        function ()
            awful.tag.incncol( 1, nil, true)
        end,
        {description = "increase the number of columns", group = "layout"}),

    awful.key({ modkey, "Control" }, "l",
        function ()
            awful.tag.incncol(-1, nil, true)
        end,
        {description = "decrease the number of columns", group = "layout"}),

    awful.key({ modkey }, "i",
        function ()
            awful.tag.incnmaster( 1, nil, true)
        end,
        {description = "increase number of master clients", group = "layout"}),

    awful.key({ modkey }, "o",
        function ()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {description = "decrease number of master clients", group = "layout"}),

    awful.key({ modkey,           }, "space",
        function ()
            awful.layout.inc( 1)
        end,
        {description = "select next", group = "layout"}),

    awful.key({ modkey, "Shift"   }, "space",
        function ()
            awful.layout.inc(-1)
        end,
        {description = "select previous", group = "layout"}),

---------------------------------- Utilities ----------------------------------
    awful.key({ modkey           }, "Return",
        function ()
            awful.spawn(terminal)
        end,
        {description = "open a terminal", group = "launcher"}),

    awful.key({ modkey, "Shift"  }, "Return",
        function ()
            awful.spawn(terminal .. " -e " .. "tmux")
        end,
        {description = "Terminal with Tmux", group = "launcher"}),

    awful.key({ altkey           }, "grave",
        function ()
            awful.spawn("urxvtc")
        end,
        {description = "URxvt client", group = "launcher"}),

    awful.key({ altkey, "Shift"  }, "grave",
        function ()
            awful.spawn("urxvtc" .. " -e " .. "tmux")
        end,
        {description = "URxvt client with Tmux", group = "launcher"}),

    awful.key({ modkey, "Shift" }, "n",
        function ()
            awful.spawn("urxvtd" .. " -q " .. "-o" .. " -f")
        end,
        {description = "URxvt daemon", group = "launcher"}),

    awful.key({ modkey }, "d",
        function ()
            awful.spawn("rofi_run")
        end,
        {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "p",
        function()
            menubar.show()
        end,
        {description = "show the menubar", group = "launcher"}),

    awful.key({ modkey }, "r",
        function ()
            awful.spawn(termapp .. "ranger")
        end,
        {description = "file manager", group = "launcher"}),


    awful.key({ modkey, "Control" }, "h",
        function ()
            awful.spawn(termapp .. "htop")
        end,
        {description = "system monitor", group = "launcher"}),


    awful.key({ altkey, "Control" }, "h",
        function ()
            awful.spawn(termapp .. "gotop")
        end,
        {description = "system monitor in Go", group = "launcher"}),

    awful.key({ modkey, altkey }, "h",
        function ()
            awful.spawn(termapp .. "nvtop")
        end,
        {description = "Nvidia GPU system monitor", group = "launcher"}),

    awful.key({ altkey }, "t",
        function ()
            awful.spawn("touchpadctl" .. " dev")
        end,
        {description = "Toggle touchpad device", group = "launcher"}),

    awful.key({ modkey, "Control" }, "t",
        function ()
            awful.spawn("touchpadctl" .. " tap")
        end,
        {description = "Toggle tap touch", group = "launcher"}),

--------------------------- Display Configurations ----------------------------
    -- Home Display Settings [ AOC Monitor ]
    awful.key({ altkey }, "w",
        function ()
            awful.spawn("setScreens" .. " 1 " .. driver .. " home")
        end,
        {description = "Single screen, home, Driver", group = "launcher"}),

    awful.key({ altkey, "Control" }, "w",
        function ()
            awful.spawn("setScreens" .. " 2 " .. driver .. " home")
        end,
        {description = "Dual screen, home, Driver", group = "launcher"}),

    -- Lab Display Settings [ Twin Dell Monitors ]
    awful.key({ modkey }, "w",
        function ()
            awful.spawn("setScreens" .. " 1 " .. driver .. " lab")
        end,
        {description = "Single screen, lab, Driver", group = "launcher"}),

    awful.key({ modkey, "Control" }, "w",
        function ()
            awful.spawn("setScreens" .. " 2 " .. driver .. " lab")
        end,
        {description = "Dual screen, lab, Driver", group = "launcher"}),

    awful.key({ modkey, "Shift" }, "w",
        function ()
            awful.spawn("setScreens" .. " 3 " .. driver .. " lab")
        end,
        {description = "Triple screen, lab, Driver", group = "launcher"}),

---------------------------- Brightness and Audio -----------------------------
    --awful.key({}), "XF86MonBrightnessUp",
--     awful.key({}), "F4",
--         function ()
--             awful.spawn("xbacklight" .. "-dec" .. "10")
--         end,
--         {description = "set backlight down", group = "launcher"},
--
--     awful.key({}), "F5",
--         function ()
--             awful.spawn("xbacklight" .. "-inc" .. "10")
--         end,
--         {description = "set backlight up", group = "launcher"}

    awful.key( { }, "F5",
        function ()
            awful.spawn("xbacklight" .. " -dec " .. "10")
        end,
        {description = "Set backlight down", group = "launcher"}),

    awful.key( { }, "F6",
        function ()
            awful.spawn("xbacklight" .. " -inc " .. "10")
        end,
        {description = "Set backlight up", group = "launcher"}),

    awful.key( { "Shift" }, "F5",
        function ()
            awful.spawn("xbacklight" .. " -set " .. "10")
        end,
        {description = "Set backlight to low", group = "launcher"}),

    awful.key( { "Shift" }, "F6",
        function ()
            awful.spawn("xbacklight" .. " -set " .. "100")
        end,
        {description = "Set backlight to max", group = "launcher"}),

    awful.key( { }, "F10",
        function ()
            awful.spawn("pulseaudio-ctl" .. " mute")
        end,
        {description = "Mute Pulseaudio", group = "launcher"}),

    awful.key( { }, "F11",
        function ()
            awful.spawn("pulseaudio-ctl" .. " down " .. "5")
        end,
        {description = "Decrease Pulseaudio volume", group = "launcher"}),

    awful.key( { "Shift" }, "F11",
        function ()
            awful.spawn("pulseaudio-ctl" .. " down " .. "10")
        end,
        {description = "Decrease Pulseaudio volume", group = "launcher"}),

    awful.key( { }, "F12",
        function ()
            awful.spawn("pulseaudio-ctl" .. " up " .. "5")
        end,
        {description = "Increase Pulseaudio volume", group = "launcher"}),

    awful.key( { "Shift" }, "F12",
        function ()
            awful.spawn("pulseaudio-ctl" .. " up " .. "10")
        end,
        {description = "Increase Pulseaudio volume", group = "launcher"}),

-------------------------------- Applications ---------------------------------
    awful.key({ modkey, "Shift" }, "h",
        function ()
            awful.spawn("qutebrowser")
        end,
        {description = "Qutebrowser", group = "launcher"}),

    awful.key({ modkey, "Shift" }, "g",
        function ()
            awful.spawn("brave")
        end,
        {description = "Brave Browser", group = "launcher"}),

    awful.key({ modkey, "Shift" }, "f",
        function ()
            awful.spawn("firefox")
        end,
        {description = "Firefox Browser", group = "launcher"}),

    awful.key({ modkey, "Control" }, "r",
        function ()
            awful.spawn("romoji")
        end,
        {description = "Select and Paste Emoji", group = "launcher"}),

    awful.key({ modkey, "Control" }, "p",
        function ()
            awful.spawn("clippw" .. " pw " .. "clip")
        end,
        {description = "Get Secret pw", group = "launcher"}),

    awful.key({ altkey, "Control" }, "p",
        function ()
            awful.spawn("clippw" .. " gm " .. "clip")
        end,
        {description = "Get Secret gm", group = "launcher"}),

------------------------------ Function Bindings ------------------------------
    awful.key({ modkey }, "F1",
        function ()
            -- awful.spawn("nvidia-settings " .. "-c" .. " :8")
            awful.spawn("nvidia-settings")
        end,
        {description = "Pamac Manager GUI", group = "launcher"}),

    awful.key({ modkey }, "F2",
        function ()
            awful.spawn("gpmdp")
        end,
        {description = "Google Play Music", group = "launcher"}),

    awful.key({ modkey }, "F3",
        function ()
            awful.spawn("spotify")
        end,
        {description = "Spotify Music", group = "launcher"}),

    awful.key({ modkey }, "F4",
        function ()
            awful.spawn("caprine")
        end,
        {description = "Facebook Messenger", group = "launcher"}),

    awful.key({ modkey }, "F5",
        function ()
            awful.spawn("yakyak")
        end,
        {description = "Google Hangouts", group = "launcher"}),

    awful.key({ modkey }, "F6",
        function ()
            awful.spawn("slack")
        end,
        {description = "Slack Dark", group = "launcher"}),

    awful.key({ modkey }, "F7",
        function ()
            awful.spawn("discord")
        end,
        {description = "Discord", group = "launcher"}),

    awful.key({ modkey }, "F8",
        function ()
            awful.spawn("steam")
        end,
        {description = "Steam", group = "launcher"}),

    awful.key({ modkey }, "F9",
        function ()
            awful.spawn("krita")
        end,
        {description = "Krita Vector Graphics", group = "launcher"}),

    awful.key({ modkey }, "F10",
        function ()
            awful.spawn("inkscape")
        end,
        {description = "Inkscape Image Editor", group = "launcher"}),

    awful.key({ modkey }, "F11",
        function ()
            awful.spawn("gimp")
        end,
        {description = "GIMP Image Editor", group = "launcher"}),

    awful.key({ modkey }, "F12",
        function ()
            awful.spawn("fiji")
        end,
        {description = "ImageJ2", group = "launcher"}),

---------------------------- Alt Function Bindings ----------------------------
    awful.key({ altkey }, "F1",
        function ()
            awful.spawn("pamac-manager")
        end,
        {description = "Pamac Manager GUI", group = "launcher"}),

    awful.key({ altkey }, "F2",
        function ()
            awful.spawn(termapp .. "ncmpcpp")
        end,
        {description = "Ncmpcpp Music Player", group = "launcher"}),

    awful.key({ altkey }, "F3",
        function ()
            awful.spawn("audacious")
        end,
        {description = "Audacious Music Player", group = "launcher"}),

    awful.key({ altkey }, "F4",
        function ()
            awful.spawn(termapp .. "pulsemixer")
        end,
        {description = "Pulsemixer volume control", group = "launcher"}),

    awful.key({ altkey }, "F5",
        function ()
            awful.spawn("arandr")
        end,
        {description = "Display Manager ArandR", group = "launcher"}),

    awful.key({ altkey }, "F6",
        function ()
            awful.spawn("droidsurf")
        end,
        {description = "Android Messages", group = "launcher"}),

    awful.key({ altkey }, "F7",
        function ()
            awful.spawn(termapp .. "rtv" .. " --enable-media")
        end,
        {description = "Command-line Reddit", group = "launcher"}),

    awful.key({ altkey }, "F8",
        function ()
            awful.spawn(editor_cmd .. " /home/jbustamante/.config/conky/func")
        end,
        {description = "Edit To-Do List", group = "launcher"}),

    awful.key({ altkey }, "F9",
        function ()
            awful.spawn(editor_cmd .. " /home/jbustamante/.config/conky/alts")
        end,
        {description = "Shopping List", group = "launcher"}),

    awful.key({ altkey }, "F10",
        function ()
            awful.spawn("thunar")
        end,
        {description = "Thunar File Manager", group = "launcher"}),

    awful.key({ altkey }, "F11",
        function ()
            awful.spawn("regencolors " .. walend .. walsat .. " -l")
        end,
        {description = "Pywal Light Scheme", group = "launcher"}),

    awful.key({ altkey }, "F12",
        function ()
            awful.spawn("regencolors " .. walend .. walsat)
        end,
        {description = "Pywal Color Scheme", group = "launcher"})

)

------------------------------- Layout Control --------------------------------
clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
       {description = "toggle fullscreen", group = "client"}),

    awful.key({ modkey, "Shift"   }, "q",
        function (c)
            c:kill()
        end,
        {description = "close", group = "client"}),

    awful.key({ modkey, "Control" }, "space",
        awful.client.floating.toggle,
        {description = "toggle floating", group = "client"}),

    awful.key({ modkey, "Control" }, "Return",
        function (c)
            c:swap(awful.client.getmaster())
        end,
        {description = "move to master", group = "client"}),

    awful.key({ modkey, "Shift"   }, "e",
        function (c)
            c:move_to_screen()
        end,
        {description = "move to screen", group = "client"}),

    awful.key({ modkey,           }, "t",
        function (c)
            c.ontop = not c.ontop
        end,
        {description = "toggle keep on top", group = "client"}),

    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),

    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),

    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),

    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"}),

--------------------------------- Tag Control ---------------------------------
    awful.key({ modkey,           }, "Left",
        awful.tag.viewprev,
        {description = "view previous", group = "tag"}),

    awful.key({ modkey,           }, "Right",
        awful.tag.viewnext,
        {description = "view next", group = "tag"}),

    awful.key({ modkey,           }, "Escape",
        awful.tag.history.restore,
        {description = "go back", group = "tag"})

)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),

        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),

        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),

        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-------------------------------------------------------------------------------
------------------------------------ Rules ------------------------------------
-------------------------------------------------------------------------------
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus        = awful.client.focus.filter,
                     raise        = true,
                     keys         = clientkeys,
                     buttons      = clientbuttons,
                     screen       = awful.screen.preferred,
                     placement    = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",   -- Firefox addon DownThemAll.
          "copyq", -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Sxiv"
          },

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-------------------------------------------------------------------------------
----------------------------------- Signals -----------------------------------
-------------------------------------------------------------------------------
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color   = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Start XScreensaver
awful.util.spawn_with_shell("xscreensaver" .. " -no-splash")

-------------------------------------------------------------------------------
------------------------------ Startup Programs -------------------------------
-------------------------------------------------------------------------------
autorun     = true
autorunApps =
{
    "/home/jbustamante/bin/setupAwesome",
}


