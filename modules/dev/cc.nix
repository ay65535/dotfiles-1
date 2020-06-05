{ config, lib, options, pkgs, ... }:

with lib; {
  options.modules.dev.cc.enable = mkOption {
    type = types.bool;
    default = false;
  };

  config = mkIf config.modules.dev.cc.enable {
    # TODO Install clang
    home.packages = with pkgs; [ llvm_10 gcc_10 gdb ];
  };
}