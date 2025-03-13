{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";

      monitor = ",preferred,auto,1";

      exec-once = [
        "waybar"
        "dunst"
        "swww init && swww img ${./wallpapers} --transition-type random"
        "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(ca9ee6ee)";
        "col.inactive_border" = "rgba(51576dee)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 5;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          new_optimizations = true;
        };
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 15;
          render_power = 3;
          color = "rgba(1a1a1aee)";
          offset = "0 5";
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      gestures = { workspace_swipe = true; };

      # Scratchpad configuration
      misc = {
        force_default_wallpaper = 0;
      };


      # Window rules
      windowrule = [
        "float,^(pavucontrol)$"
        "float,^(nm-connection-editor)$"
        "size 80% 80%,^(ghostty)$"
        "center,^(ghostty)$"
        "rounding 5,^(ghostty)$"
        "opacity 0.95 0.95,^(ghostty)$"

        # Dolphin rules
        "rounding 5,^(dolphin)$"
        "opacity 0.95 0.95,^(dolphin)$"

        # Obsidian rules
        "rounding 5,^(obsidian)$"
        "opacity 0.98 0.98,^(obsidian)$"
        "workspace 2,^(obsidian)$"
      ];

      # Keybindings
      bind = [
        "$mod, Return, exec, ghostty"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, Space, exec, wofi --show drun"
        "$mod, V, togglefloating"
        "$mod, F, fullscreen"
        "$mod, J, layoutmsg, togglesplit"
        "$mod, Y, exec, hyprctl dispatch layoutmsg togglesplit"
        
        # Scratchpad bindings
        "$mod, S, togglespecialworkspace, scratchpad"
        "$mod SHIFT, S, movetoworkspace, special:scratchpad"

        # Move focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Switch workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"

        # Move active window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
      ];

      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
    };
  };

  # Waybar configuration with Catppuccin Frappé theme
  programs.waybar = {
    enable = true;
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        min-height: 0;
        border: none;
        border-radius: 0;
        margin: 0;
        padding: 0;
      }

      window#waybar {
        background: #303446;
        color: #c6d0f5;
      }

      #workspaces {
        background: #292c3c;
        margin: 5px;
        padding: 0 5px;
        border-radius: 5px;
      }

      #workspaces button {
        padding: 0 5px;
        color: #c6d0f5;
      }

      #workspaces button.active {
        color: #ca9ee6;
      }

      #clock {
        background: #292c3c;
        padding: 0 10px;
        margin: 5px;
        border-radius: 5px;
      }

      #network,
      #pulseaudio,
      #cpu,
      #memory,
      #temperature,
      #custom-power {
        background: #292c3c;
        padding: 0 10px;
        margin: 5px;
        border-radius: 5px;
      }

      #custom-power {
        color: #e78284;
        padding-right: 15px;
        margin-right: 5px;
      }

      #network {
        color: #8caaee;
      }

      #network.disconnected {
        color: #c6d0f5;
        background: #292c3c;
      }

      #memory {
        color: #81c8be;
      }

      #temperature {
        color: #ef9f76;
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "network" "pulseaudio" "cpu" "memory" "temperature" "custom/power" ];

        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };

        clock = {
          format = "{:%H:%M %d/%m/%Y}";
          tooltip = false;
        };

        network = {
          format-wifi = "󰖩 {essid}";
          format-ethernet = "󰈀 Connected";
          format-disconnected = "󰖪 Disconnected";
          tooltip-format = "{ipaddr} via {ifname}";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname} ";
          tooltip-format-disconnected = "Disconnected";
          on-click = "nm-connection-editor";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          format-icons = [ "" "" "" ];
          on-click = "pavucontrol";
        };

        cpu = {
          format = "󰻠 {usage}%";
          interval = 1;
        };

        memory = {
          format = "󰍛 {}%";
          interval = 1;
        };

        temperature = {
          format = "󰔏 {temperatureC}°C";
          thermal-zone = 0;
          critical-threshold = 80;
          format-critical = "󱃂 {temperatureC}°C";
          interval = 2;
        };

        "custom/power" = {
          format = "⏻";
          on-click = "${pkgs.rofi}/bin/rofi -show power-menu -modi power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
          tooltip = false;
        };
      };
    };
  };

  # Wofi launcher with Catppuccin Frappé theme
  programs.wofi = {
    enable = true;
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 14px;
      }

      window {
        background-color: #303446;
        border: 2px solid #ca9ee6;
        border-radius: 8px;
      }

      #input {
        margin: 5px;
        background-color: #292c3c;
        border: 1px solid #51576d;
        border-radius: 4px;
        color: #c6d0f5;
      }

      #inner-box {
        margin: 5px;
        background-color: #303446;
      }

      #outer-box {
        margin: 5px;
        background-color: #303446;
      }

      #scroll {
        margin: 5px;
      }

      #text {
        margin: 5px;
        color: #c6d0f5;
      }

      #entry:selected {
        background-color: #ca9ee6;
        border-radius: 4px;
      }

      #text:selected {
        color: #303446;
      }
    '';
  };

  # SwayLock configuration
  programs.swaylock = {
    enable = true;
    settings = {
      color = "303446";
      font = "JetBrainsMono Nerd Font";
      indicator-radius = 100;
      indicator-thickness = 7;
      inside-color = "303446";
      inside-clear-color = "303446";
      inside-ver-color = "303446";
      inside-wrong-color = "303446";
      key-hl-color = "ca9ee6";
      line-color = "303446";
      line-clear-color = "303446";
      line-ver-color = "303446";
      line-wrong-color = "303446";
      ring-color = "51576d";
      ring-clear-color = "e5c890";
      ring-ver-color = "8caaee";
      ring-wrong-color = "e78284";
      text-color = "c6d0f5";
      text-clear-color = "c6d0f5";
      text-ver-color = "c6d0f5";
      text-wrong-color = "c6d0f5";
    };
  };

  # SwayIdle configuration
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        timeout = 600;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };

  # Dunst notification daemon with Catppuccin theme
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#ca9ee6";
        separator_color = "#ca9ee6";
        font = "JetBrainsMono Nerd Font 10";
        corner_radius = 8;
        offset = "10x10";
      };

      urgency_low = {
        background = "#303446";
        foreground = "#c6d0f5";
      };

      urgency_normal = {
        background = "#303446";
        foreground = "#c6d0f5";
      };

      urgency_critical = {
        background = "#303446";
        foreground = "#e78284";
        frame_color = "#e78284";
      };
    };
  };
}
