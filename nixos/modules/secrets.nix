{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.hosts.secrets;
in {
  options.hosts.secrets = {
    hosts = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = {
    age = {
      identityPaths = [
        "/home/yzld2002/.ssh/id_ed25519"
      ];
      secrets = {
        traefik.dnspod.file = ../../secrets/traefik.dnspod.age;
      };
    };
  };
}
