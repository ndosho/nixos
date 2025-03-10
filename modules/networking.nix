{pkgs, ...}: {
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Dar_es_Salaam";

  services.ntp = {
    enable = true;
  };
}
