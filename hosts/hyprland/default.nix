{ ... }: {
  imports = [
    ./hardware.nix
    ./system.nix
    ./user.nix
    ../../modules/networking.nix
    ../../modules/packages.nix
    ../../modules/emacs.nix
  ];
}
