{ config, lib, pkgs, ... }:

with lib; {
  options.modules.dev.tools.ansible.enable = mkOption {
    type = types.bool;
    default = false;
  };

  config = mkIf config.modules.dev.tools.ansible.enable {
    modules = {
      dev.editors.tools.packages = with python37Packages; [ ansible-lint ];
      shell.zsh.zinitPluginsInit = ''
        zinit snippet OMZP::ansible/ansible.plugin.zsh
      '';
    };

    my.packages = with pkgs; [ ansible ];
  };
}
