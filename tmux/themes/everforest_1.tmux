# Everforrest theme
# [START]----------- THEME CONFIGURATION ------------------
# Highlight color: #a7c080
# Normal color: #d3c6aa
# Background color: #333C43

set -g message-style "fg=colour231,bg=colour240"

set -g @dark_color "#333C43"
set -g @light_color "#a7c080"

set -g status-justify "left"
set -g status-left-style "none"
set -g status-right-style "none"
set -g status-style "none,bg=colour236"
set -g status-right-length "100"
set -g status-left-length "100"

set -g status-justify "centre"

# [COLORIZE]
set -g status-bg "#333C43"

# ** Pane Status
# [COLORIZE]
set -g pane-border-style "fg=#d3c6aa"
set -g pane-active-border-style "fg=#a7c080,bold"

setw -g pane-border-status "bottom"
setw -g pane-border-format " ###P "
setw -g pane-border-lines "simple"
# ---- Bars -------
# [COLORIZE]
set -g status-left "#[fg=#a7c080,bg=#333C43]#[fg=#333C43,bg=#a7c080] │#[fg=#333C43,bg=#d3c6aa] #S #[fg=#d3c6aa,bg=#333C43]"
set -g status-right "#[fg=#E67E80,bg=#333C43]#[fg=#333C43,bg=#E67E80] │#[fg=#333C43,bg=#d3c6aa] %Y-%m-%d #[fg=#d3c6aa,bg=#333C43] #[fg=#E69875,bg=#333C43]#[fg=#333C43,bg=#E69875]祥│#[fg=#333C43,bg=#d3c6aa] %H:%M #[fg=#d3c6aa,bg=#333C43]"
# ---- Windows ----
setw -g window-status-activity-style "none"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#15d69e,bg=colour236"

# [COLORIZE]
set -g window-status-format "#[fg=#d3c6aa,bg=#333C43]#[fg=#333C43,bg=#d3c6aa] #I│#[fg=#333C43,bg=#d3c6aa]#W #[fg=#d3c6aa,bg=#333C43] "
set -g window-status-current-format "#[fg=#a7c080,bg=#333C43]#[fg=#333C43,bg=#a7c080] #I│#[fg=#333C43,bg=#a7c080] #W #[fg=#a7c080,bg=#333C43] "
# [END]----------- THEME CONFIGURATION ------------------
