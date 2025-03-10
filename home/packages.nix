{ pkgs, ... }: {
  home.packages = with pkgs; [ git nixfmt nixd alacritty brave ];

}
