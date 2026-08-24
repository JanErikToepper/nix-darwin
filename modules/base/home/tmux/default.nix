{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
    ];

    extraConfig = ''
      set -g escape-time 0
      set -g focus-events on
      set -g default-terminal 'screen-256color'

      set -g prefix C-s
      set -g status-style fg=white,bg=black
      set -g status-left-length 100
      set -g status-right '''
      set -g window-status-format '#I:#W'
      set -g window-status-current-format '#I:#W'
      set -g window-status-current-style bold

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      bind-key J swap-pane -D
      bind-key K swap-pane -U

      bind-key w swap-window -t +1\; select-window -t +1
      bind-key W swap-window -t -1\; select-window -t -1

      bind-key S setw synchronize-panes

      bind-key c new-window -c "#{pane_current_path}"
      bind-key C new-session -c "#{pane_current_path}"

      bind-key V splitw -h -c "#{pane_current_path}"
      bind-key H splitw -v -c "#{pane_current_path}"

      bind-key x kill-pane
    '';
  };

  home.file.".tmux-layouts/.ignore".text = "";
}
