# Everforrest theme
# [START]----------- THEME CONFIGURATION ------------------
# Highlight color: #a7c080
# Normal color: #d3c6aa
# Background color: #2d353b

set -g message-style "fg=colour231,bg=colour240"

set -g @dark_color "#2d353b"
set -g @light_color "#a7c080"
#
set -g status-justify "left"
set -g status-left-style "none"
set -g status-right-style "none"
set -g status-style "none,bg=colour236"
set -g status-right-length "100"
set -g status-left-length "100"

set -g status-justify "centre"

# [COLORIZE]
set -g status-bg "#2d353b"

# ** Pane Status
# [COLORIZE]
set -g pane-border-style "fg=#d3c6aa"
set -g pane-active-border-style "fg=#a7c080,bold"

setw -g pane-border-status "bottom"
setw -g pane-border-format " ###P "
setw -g pane-border-lines "simple"
# ---- Bars -------
# [COLORIZE]
set -g status-left "#[fg=#2d353b,bg=#a7c080]   #S#[fg=#white,bg=#a7c080]▕"
set -g status-right "#[fg=#2d353b,bg=#a7c080] %Y-%m-%d  #[fg=#2d353b,bg=2d353b]▕#[fg=#a7c080,bg=#2d353b]#[fg=#2d353b,bg=#a7c080] %H:%M 祥"
# ---- Windows ----
setw -g window-status-activity-style "none"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#15d69e,bg=colour236"
# [COLORIZE]
set -g window-status-format "#[fg=#2d353b,bg=#9da9a0] #I  #[fg=#2d353b,bg=#9da9a0]#W #F #[fg=#2d353b,bg=#9da9a0]▕"
set -g window-status-current-format "#[fg=#2d353b,bg=#a7c080]   #[fg=#2d353b,bg=#a7c080]#[fg=#2d353b,bg=#a7c080]#W #F #[fg=#a7c080,bg=#2d353b]"
# [END]----------- THEME CONFIGURATION ------------------
# {
#       \ 'fg':         ['#d3c6aa',   '223'],
#       \ 'red':        ['#e67e80',   '167'],
#       \ 'orange':     ['#e69875',   '208'],
#       \ 'yellow':     ['#dbbc7f',   '214'],
#       \ 'green':      ['#a7c080',   '142'],
#       \ 'aqua':       ['#83c092',   '108'],
#       \ 'blue':       ['#7fbbb3',   '109'],
#       \ 'purple':     ['#d699b6',   '175'],
#       \ 'grey0':      ['#7a8478',   '243'],
#       \ 'grey1':      ['#859289',   '245'],
#       \ 'grey2':      ['#9da9a0',   '247'],
#       \ 'statusline1':['#a7c080',   '142'],
#       \ 'statusline2':['#d3c6aa',   '223'],
#       \ 'statusline3':['#e67e80',   '167'],
#       \ 'none':       ['NONE',      'NONE']
# }
