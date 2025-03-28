#!/usr/bin/env bash

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  echo "tmux needs to be running"
  exit 1
fi

search=$({ \
  echo "DISABLE_SPRING=true bundle exec rails c"; \
  echo "bundle exec rails c"; \
  echo "bundle exec irb"; \
  echo "attach-session -t . -c ~/Works"; \
  echo "other command"; \
} | fzf-tmux -p -w 100% -h 50% -y S)

if [[ -n $search ]]; then
  tmux send-keys "${search}"
fi
