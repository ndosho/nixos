{pkgs, ...}: {
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;
  networking.hostId = "8425e349";

  time.timeZone = "Africa/Dar_es_Salaam";

  services.ntp = {
    enable = true;
  };
}
