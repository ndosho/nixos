{ pkgs, ... }: {
  home.packages = [ pkgs.emacs ];
  services.emacs = {
    enable = true;
    client = {
      enable = true;
      arguments = [ "-c" "-a ''" ];
    };
    startWithUserSession = true;
  };
}
