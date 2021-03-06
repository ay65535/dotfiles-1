{ config, lib, pkgs, ... }:

with lib; {
  options.modules.dev.tools.googleCloudSdk.enable = mkOption {
    type = types.bool;
    default = false;
  };

  config = mkIf config.modules.dev.tools.googleCloudSdk.enable {
    modules.shell.zsh.zinitPluginsInit = ''
      zinit ice wait'''
      zinit snippet "''${CLOUDSDK_ROOT_DIR}/completion.zsh.inc"
    '';

    my.packages = with pkgs; [ google-cloud-sdk ];
    my.env.CLOUDSDK_ROOT_DIR = "${pkgs.google-cloud-sdk}/google-cloud-sdk";
  };
}
