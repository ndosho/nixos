{ pkgs, ... }: {
  home.packages = with pkgs; [ git tmux  nixfmt nixd brave yazi ];
}
