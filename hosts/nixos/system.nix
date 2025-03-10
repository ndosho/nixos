{ ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "caps:escape";

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.openssh.enable = true;

  environment.sessionVariables = { FLAKE = "/home/ns/nixos"; };

  fonts.fontDir.enable = true;

  system.stateVersion = "24.11";
}
