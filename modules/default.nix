{ config, lib, options, pkgs, ... }:

with lib; {
  imports = [ ./dev ./shell ];
}
