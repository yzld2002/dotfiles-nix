{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.hosts.openssh;
in {
  options.hosts.openssh = {
    enable = mkEnableOption "Enable OpenSSH server";
  };

  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = false;
      settings.PermitRootLogin = "no";
      ports = [22];
      openFirewall = true;
      hostKeys = [
        {
          path = "/home/yzld2002/.ssh/id_ed25519";
          type = "ed25519";
        }
      ];
    };
  };
}
