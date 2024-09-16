{ config, lib, pkgs, ... }:
with lib; let
  cfg = config.hosts.vaultwarden;
in
{
  options.hosts.vaultwarden = {
    enable = mkEnableOption "BitwardenRS";
  };

  config = mkIf cfg.enable {
    services.vaultwarden = {
      enable = true;
      backupDir = "/home/yzld2002/download/vaultwarden";
      environmentFile = [ "${config.age.secrets.vaultwarden.path}" ];
      config = {
        DOMAIN = "https://vaultwarden.yzld2002.cn";
        SIGNUPS_ALLOWED = true;
        ROCKET_ADDRESS = "::1";
      };
    };
  };

}
