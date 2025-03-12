{pkgs, ...}: {
  users.users.ns = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable 'sudo' for the user.
    packages = with pkgs; [
      tree
    ];
  };
}
