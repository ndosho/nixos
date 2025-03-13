# Configuration for XDG directories and desktop entries
{ config, ... }: {
  xdg = {
    enable = true;
    
    # Desktop entries configuration
    desktopEntries = {
      logseq = {
        name = "Logseq";
        genericName = "Knowledge Base";
        comment = "A privacy-first, open-source platform for knowledge management and collaboration";
        exec = "appimage-run ${config.home.homeDirectory}/Applications/Logseq-linux-x64-0.10.9.AppImage";
        icon = "${config.home.homeDirectory}/Applications/logseq.png";
        terminal = false;
        categories = [ "Office" "ProjectManagement" "Education" ];
        startupNotify = true;
      };
    };
  };
}
