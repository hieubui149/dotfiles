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

# [COLORIZE]
set -g status-bg "#2e3540"

# ** Pane Status
# [COLORIZE]
set -g pane-border-style "fg=#2e3540"
set -g pane-active-border-style "fg=#89c0d0,bold"

setw -g pane-border-status "bottom"
setw -g pane-border-format " ###P "
setw -g pane-border-lines "simple"
# ---- Bars -------
# [COLORIZE]
set -g status-left "#[fg=#2e3540,bg=#89c0d0]  #S #[fg=#89c0d0,bg=#2e3540]"
set -g status-right "  #(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD) #[fg=#89c0d0,bg=#2e3540]#[fg=#89c0d0,bg=#2e3540] %Y-%m-%d  #[fg=white,bg=2e3540]#[fg=#89c0d0,bg=#2e3540]#[fg=#2e3540,bg=#89c0d0] %H:%M 祥"
# ---- Windows ----
setw -g window-status-activity-style "none"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#15d69e,bg=colour236"
# [COLORIZE]
set -g window-status-format "#[fg=white,bg=#2e3540] #I #[fg=white,bg=#2e3540,nobold,noitalics,nounderscore] #[fg=white,bg=#2e3540]#W #F "
set -g window-status-current-format "#[fg=#2e3540,bg=#89c0d0]#[fg=#2e3540,bg=#89c0d0]煮#[fg=#2e3540,bg=#89c0d0] #[fg=#2e3540,bg=#89c0d0]#W #F #[fg=#89c0d0,bg=#2e3540]"
# [END]----------- THEME CONFIGURATION ------------------
