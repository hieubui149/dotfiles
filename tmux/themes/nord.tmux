# Nord theme
# [START]----------- THEME CONFIGURATION ------------------
set -g message-style "fg=colour231,bg=colour240"

set -g @dark_color "#2e3540"
set -g @light_color "#89c0d0"
#
set -g status-justify "left"
set -g status-left-style "none"
set -g status-right-style "none"
set -g status-style "none,bg=colour236"
set -g status-right-length "100"
set -g status-left-length "100"

set -g status-justify "centre"

# [COLORIZE]
set -g status-bg "#2e3540"

# ** Pane Status
# [COLORIZE]
set -g pane-border-style "fg=#4c5569"
set -g pane-active-border-style "fg=#89c0d0,bold"

setw -g pane-border-status "bottom"
setw -g pane-border-format " ###P "
setw -g pane-border-lines "simple"
# ---- Bars -------
# [COLORIZE]
set -g status-left "#[fg=#2e3540,bg=#89c0d0]   #S #[fg=#89c0d0,bg=#2e3540] "
set -g status-right "#[fg=#89c0d0,bg=#2e3540] %Y-%m-%d  #[fg=#89c0d0,bg=2e3540]▕#[fg=#89c0d0,bg=#2e3540]#[fg=#89c0d0,bg=#2e3540] %H:%M 祥"
# ---- Windows ----
setw -g window-status-activity-style "none"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#15d69e,bg=colour236"
# [COLORIZE]
set -g window-status-format "#[fg=white,bg=#4c5569] #I #[fg=white,bg=#2e3540]   #[fg=white,bg=#2e3540]#W "
set -g window-status-current-format "#[fg=#2e3540,bg=#89c0d0] #I▕   #[fg=#2e3540,bg=#89c0d0]#[fg=#2e3540,bg=#89c0d0]#W #F "
# [END]----------- THEME CONFIGURATION ------------------
