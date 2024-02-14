{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.hosts.atuin-server;
in {
  options.hosts.atuin-server = {
    enable = mkEnableOption "Synchronize zsh history files";
  };

  config = mkIf cfg.enable {
    services.atuin = {
      enable = true;
      openRegistration = false;
    };
  };
}
