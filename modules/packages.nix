{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    zsh
    wget
    curl
    jujutsu
    git
    nh
    nvd
    nix-output-monitor
  ];

  programs.zsh.enable = true;
}
