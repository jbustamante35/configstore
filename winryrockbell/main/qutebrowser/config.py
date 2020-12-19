# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

import subprocess
import sys

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

############################# Colors ##########################################
def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

def clamp(val, minimum=0, maximum=255):
    if val < minimum:
        return minimum
    if val > maximum:
        return maximum
    return val

def adjust(hexstr, scalefactor):
    hexstr = hexstr.strip('#')
    if scalefactor < 0 or len(hexstr) != 6:
        return hexstr

    r, g, b = int(hexstr[:2], 16), int(hexstr[2:4], 16), int(hexstr[4:], 16)
    r = int(clamp(r * scalefactor))
    g = int(clamp(g * scalefactor))
    b = int(clamp(b * scalefactor))

    return "#%02x%02x%02x" % (r, g, b)

xresources = read_xresources('*')

c.colors.completion.category.bg                 = xresources['*.background']
c.colors.completion.category.border.bottom      = xresources['*.color8']
c.colors.completion.category.border.top         = xresources['*.color0']
c.colors.completion.category.fg                 = xresources['*.color8']
c.colors.completion.even.bg                     = xresources['*.background']
c.colors.completion.item.selected.bg            = xresources['*.color0']
c.colors.completion.item.selected.border.bottom = xresources['*.color0']
c.colors.completion.item.selected.border.top    = xresources['*.color0']
c.colors.completion.item.selected.fg            = xresources['*.color7']
c.colors.completion.match.fg                    = xresources['*.color7']
c.colors.completion.odd.bg                      = xresources['*.background']
c.colors.completion.scrollbar.bg                = xresources['*.background']
c.colors.completion.scrollbar.fg                = xresources['*.color2']

c.colors.downloads.bar.bg    = xresources['*.color0']
c.colors.downloads.error.bg  = xresources['*.color1']
c.colors.downloads.error.fg  = xresources['*.color7']
c.colors.downloads.start.bg  = xresources['*.color2']
c.colors.downloads.start.fg  = xresources['*.color7']
c.colors.downloads.stop.bg   = xresources['*.background']
c.colors.downloads.stop.fg   = xresources['*.color7']
c.colors.downloads.system.bg = 'none'
c.colors.downloads.system.fg = 'none'

c.colors.hints.fg       = xresources['*.color0']
c.colors.hints.match.fg = xresources['*.color2']

c.colors.messages.error.bg       = xresources['*.color1']
c.colors.messages.error.border   = xresources['*.color1']
c.colors.messages.error.fg       = xresources['*.color7']
c.colors.messages.info.bg        = xresources['*.color0']
c.colors.messages.info.border    = xresources['*.color0']
c.colors.messages.info.fg        = xresources['*.color7']
c.colors.messages.warning.bg     = xresources['*.color1']
c.colors.messages.warning.border = xresources['*.color1']
c.colors.messages.warning.fg     = xresources['*.color7']

c.colors.prompts.bg          = xresources['*.color7']
c.colors.prompts.border      = '1px solid gray'
c.colors.prompts.fg          = xresources['*.color7']
c.colors.prompts.selected.bg = xresources['*.background']

c.colors.statusbar.caret.bg             = xresources['*.color5']
c.colors.statusbar.caret.fg             = xresources['*.color7']
c.colors.statusbar.caret.selection.bg   = '#a12dff'
c.colors.statusbar.caret.selection.fg   = xresources['*.color7']
c.colors.statusbar.command.bg           = xresources['*.color0']
c.colors.statusbar.command.fg           = xresources['*.color7']
c.colors.statusbar.command.private.bg   = xresources['*.color7']
c.colors.statusbar.command.private.fg   = xresources['*.color7']
c.colors.statusbar.insert.bg            = xresources['*.color2']
c.colors.statusbar.insert.fg            = xresources['*.color7']
c.colors.statusbar.normal.bg            = xresources['*.color0']
c.colors.statusbar.normal.fg            = xresources['*.foreground']
c.colors.statusbar.passthrough.bg       = xresources['*.color4']
c.colors.statusbar.passthrough.fg       = xresources['*.foreground']
c.colors.statusbar.private.bg           = '#666666'
c.colors.statusbar.private.fg           = xresources['*.foreground']
c.colors.statusbar.progress.bg          = xresources['*.color7']
c.colors.statusbar.url.fg               = xresources['*.foreground']
c.colors.statusbar.url.hover.fg         = xresources['*.color6']
c.colors.statusbar.url.success.https.fg = adjust(xresources['*.foreground'], 0.7)
c.colors.statusbar.url.warn.fg          = xresources['*.color3']

c.colors.tabs.bar.bg           = xresources['*.background']
c.colors.tabs.even.bg          = adjust(xresources['*.background'], 1.15)
c.colors.tabs.even.fg          = xresources['*.color7']
c.colors.tabs.indicator.error  = '#ff0000'
c.colors.tabs.odd.bg           = adjust(xresources['*.background'], 1.35)
c.colors.tabs.odd.fg           = xresources['*.color7']
c.colors.tabs.selected.even.bg = adjust(xresources['*.background'], 1.15)
c.colors.tabs.selected.even.fg = xresources['*.color3']
c.colors.tabs.selected.odd.bg  = adjust(xresources['*.background'], 1.35)
c.colors.tabs.selected.odd.fg  = xresources['*.color3']

#c.colors.webpage.bg = "#ffffff"
c.colors.webpage.bg = "#000000"

######################### Configurations ######################################
# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '~/Downloads'

# Hide the statusbar unless a message is shown.
# Type: Bool
#c.statusbar.hide = 0

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'multiple'

## Behavior when the last tab is closed.
## Type: String
## Valid values:
##   - ignore: Don't do anything.
##   - blank: Load a blank page.
##   - startpage: Load the start page.
##   - default-page: Load the default page.
##   - close: Close the window.
c.tabs.last_close = 'close'

## Enable smooth scrolling for web pages. Note smooth scrolling does not
## work with the `:scroll-px` command.
## Type: Bool
c.scrolling.smooth = False

## Show a scrollbar.
## Type: Bool
c.scrolling.bar            = 'never'
#c.url.default_page        = 'https://bing.com'
#c.url.start_pages         = ['https://bing.com']
c.url.default_page         = '/home/jbustamante/Documents/repos/startpage/index.html'
c.url.start_pages          = ['/home/jbustamante/Documents/repos/startpage/index.html']
#c.content.user_stylesheets = ['/home/jbustamante/Documents/misc/startpage/style.css']

## Definitions of search engines which can be used via the address bar.
## Maps a searchengine name (such as `DEFAULT`, or `ddg`) to a URL with a
## `{}` placeholder. The placeholder will be replaced by the search term,
## use `{{` and `}}` for literal `{`/`}` signs. The searchengine named
## `DEFAULT` is used when `url.auto_search` is turned on and something
## else than a URL was entered to be opened. Other search engines can be
## used by prepending the search engine name to the search term, e.g.
## `:open google qutebrowser`.
## Type: Dict
c.url.searchengines = {
      'DEFAULT': 'https://bing.com/?q={}',
      'b': 'https://bing.com/?q={}',
      'bim': 'https://www.bing.com/images/search?q={}',
      'g': 'https://www.google.com/search?q={}',
      'gim': 'https://www.google.com/search?tbm=isch&q={}',
      'd': 'https://duckduckgo.com/?q={}',
      'dim': 'https://duckduckgo.com/?q={}&iar=images&iax=images&ia=images',
      'aw': 'https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}',
      'wt': 'http://en.wiktionary.org/?search={}',
      'w': 'https://www.wikipedia.org/search-redirect.php?family=wikipedia&language=en&search={}&language=en&go=Go',
      'yt': 'https://www.youtube.com/results?search_query={}',
        }

######################### Custom Bindings #####################################
config.bind('d', 'scroll-page 0 0.5')
config.bind('u', 'scroll-page 0 -0.5')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('<Ctrl-,>', 'tab-give')
config.bind('Q', 'quit')

config.source('shortcuts.py')

