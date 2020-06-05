{ config, lib, options, pkgs, ... }:

with lib; {
  options.modules.dev.git.enable = mkOption {
    type = types.bool;
    default = false;
  };

  config = mkIf config.modules.dev.git.enable {
    home.packages = [ pkgs.git ];

    xdg.configFile = {
      "git/config".source = <config/git/config>;
      "git/ignore".source = <config/git/ignore>;
    };
  };
}