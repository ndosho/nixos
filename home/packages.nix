{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    tmux
    nixfmt
    nixd
    brave
    yazi
    rofi
    rofi-power-menu
    windsurf
    kdePackages.dolphin

    # Rust development tools
    rustc
    cargo
    rust-analyzer
    clippy
    rustfmt
    gcc

    # AppImage support
    appimage-run
  ];
}
