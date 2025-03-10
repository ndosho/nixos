{ pkgs, ... }: { home.packages = with pkgs; [ git nixfmt nixd brave yazi ]; }
