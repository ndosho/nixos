{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    package = pkgs.helix;
    settings = {
      theme = "onedark";
      editor = {
        end-of-line-diagnostics = "hint";
        line-number = "relative";
        mouse = false;
        cursorline = true;
        rulers = [ 80 120 ];
        true-color = true;
      };
      editor.inline-diagnostics.cursor-line = "error";
      editor.file-picker = { hidden = false; };
      editor.statusline = {
        left = [ "mode" "spinner" "file-name" ];
        center = [ ];
        right = [ "diagnostics" "position" "file-type" ];
      };
    };
    languages = {
      language = [{
        name = "nix";
        scope = "source.nix";
        file-types = [ "nix" ];
        auto-format = true;
        formatter = { command = "nixfmt"; };
      }];
      language-server.nixd = { command = "nixd"; };
    };
  };

  home.file.".config/helix/language.toml".text = ''
    [[language]]
    name = "nix"
    scope = "source.nix"
    file-types = ["nix"]
    auto-format = true
    formatter = { command = "nixfmt"}
    language-servers = ["nixd"]

    [[language-server.nixd]]
    command = "nixd"
  '';
}
