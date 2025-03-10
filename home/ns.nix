{ ... }: {
  home.username = "ns";
  home.homeDirectory = "/home/ns";
  home.stateVersion = "24.11";
  imports = [ ./zsh.nix ./helix.nix ./packages.nix ];
}
