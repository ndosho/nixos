{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["ahci" "xhci_pci" "usbhid" "usb_storage" "sd_mod" "sr_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  # Note: You'll need to replace these UUIDs with your actual disk UUIDs
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/e65d4a5a-870a-4273-8151-41c17bf3a881";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D26A-038D";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/dd27d1fc-0039-45b9-80b3-7d6f3cbe51ec";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
