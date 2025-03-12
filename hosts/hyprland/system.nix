{ pkgs, ... }: {
  # Import Catppuccin theme colors
  _module.args.catppuccin = {
    accent = "#ca9ee6";
    rosewater = "#f2d5cf";
    flamingo = "#eebebe";
    pink = "#f4b8e4";
    mauve = "#ca9ee6";
    red = "#e78284";
    maroon = "#ea999c";
    peach = "#ef9f76";
    yellow = "#e5c890";
    green = "#a6d189";
    teal = "#81c8be";
    sky = "#99d1db";
    sapphire = "#85c1dc";
    blue = "#8caaee";
    lavender = "#babbf1";
    text = "#c6d0f5";
    subtext1 = "#b5bfe2";
    subtext0 = "#a5adce";
    overlay2 = "#949cbb";
    overlay1 = "#838ba7";
    overlay0 = "#737994";
    surface2 = "#626880";
    surface1 = "#51576d";
    surface0 = "#414559";
    base = "#303446";
    mantle = "#292c3c";
    crust = "#232634";
  };
  # GRUB bootloader configuration
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # Locale settings
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable X11 and Cosmic desktop
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;

    # Keyboard settings
    xkb = {
      layout = "us";
      options = "caps:escape";
    };
  };

  # Install required packages
  environment.systemPackages = with pkgs; [
    # Core packages
    waybar
    ghostty
    wofi
    swww # For wallpapers
    swaylock-effects
    swayidle
    wl-clipboard
    wf-recorder
    grim
    slurp
    
    # System tray applications
    networkmanagerapplet
    pavucontrol
    
    # Notifications
    dunst
    libnotify
    
    # Theming
    catppuccin-gtk
    papirus-icon-theme
    
    # Utilities
    brightnessctl
    pamixer
    playerctl
    jq
    socat
  ];

  # Audio configuration
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Input device support
  services.libinput.enable = true;

  # Nix settings
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    # Substituters
    substituters = [
      "https://cache.nixos.org"
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
    ];
    # Add trusted public keys
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    # Trusted users
    trusted-users = [ "root" "@wheel" ];
    # Auto-optimize store
    auto-optimise-store = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # SSH server
  services.openssh.enable = true;

  # Environment variables
  environment.sessionVariables = { FLAKE = "/home/ns/nixos"; };

  # Font configuration
  fonts.fontDir.enable = true;

  # System version
  system.stateVersion = "24.11";
}
