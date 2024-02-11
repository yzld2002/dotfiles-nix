{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.hosts.docker;
in {
  options.hosts.docker = {
    enable = mkEnableOption "Enable docker";
  };

  config = mkIf cfg.enable {
    # Docker configuration
    virtualisation.docker.enable = true;
    users.users.yzld2002.extraGroups = ["docker"];
  };
}
