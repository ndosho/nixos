{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = "drun,power-menu:rofi-power-menu";
      show-icons = true;
      drun-display-format = "{name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-power-menu = "  Power Menu";
      sidebar-mode = true;
    };
    font = "JetBrainsMono Nerd Font 12";
    terminal = "ghostty";
    theme = {
      "*" = {
        background = "#303446";
        background-alt = "#414559";
        foreground = "#C6D0F5";
        selected = "#51576D";
        active = "#8CAAEE";
        urgent = "#E78284";
        border-color = "#CA9EE6";
      };

      "window" = {
        background-color = "@background";
        border = 3;
        border-color = "@border-color";
        padding = 5;
      };

      "mainbox" = {
        border = 0;
        padding = 0;
      };

      "message" = {
        border = "1px dash 0px 0px";
        padding = 1;
      };

      "listview" = {
        fixed-height = false;
        border = "2px dash 0px 0px";
        spacing = 2;
        scrollbar = true;
        padding = "2px 0px 0px";
      };

      "element" = {
        border = 0;
        padding = 1;
      };

      "element normal.normal" = {
        background-color = "@background";
        text-color = "@foreground";
      };

      "element normal.urgent" = {
        background-color = "@urgent";
        text-color = "@foreground";
      };

      "element normal.active" = {
        background-color = "@active";
        text-color = "@background";
      };

      "element selected.normal" = {
        background-color = "@selected";
        text-color = "@foreground";
      };

      "element selected.urgent" = {
        background-color = "@urgent";
        text-color = "@foreground";
      };

      "element selected.active" = {
        background-color = "@active";
        text-color = "@background";
      };

      "element alternate.normal" = {
        background-color = "@background";
        text-color = "@foreground";
      };

      "element alternate.urgent" = {
        background-color = "@urgent";
        text-color = "@foreground";
      };

      "element alternate.active" = {
        background-color = "@active";
        text-color = "@background";
      };

      "scrollbar" = {
        width = 4;
        border = 0;
        handle-color = "@selected";
        handle-width = 8;
        padding = 0;
      };

      "sidebar" = {
        border = "2px dash 0px 0px";
      };

      "button" = {
        text-color = "@foreground";
        padding = 1;
      };

      "button selected" = {
        background-color = "@active";
        text-color = "@background";
      };

      "inputbar" = {
        spacing = 0;
        text-color = "@foreground";
        padding = 1;
        children = [ "prompt" "textbox-prompt-colon" "entry" "case-indicator" ];
      };

      "case-indicator" = {
        spacing = 0;
        text-color = "@foreground";
      };

      "entry" = {
        spacing = 0;
        text-color = "@foreground";
      };

      "prompt" = {
        spacing = 0;
        text-color = "@foreground";
      };

      "textbox-prompt-colon" = {
        expand = false;
        str = ":";
        margin = "0px 0.3em 0em 0em";
        text-color = "@foreground";
      };
    };
  };
}
