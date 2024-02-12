{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.hosts.traefik;
in {
  options.hosts.traefik = {
    enable = mkEnableOption "Traefik reverse proxy";
  }; 
  config = mkIf cfg.enable {
    services.traefik = {
      enable = true;
      environmentFiles = [ "${config.age.secrets.dnspod.path}" ];
      staticConfigOptions = {
        api = {
          dashboard = true;
        };
        entryPoints = {
          https = {
            address = ":443";
            http = {
              tls = {
                certResolver = "tencentcloud";
                domains = [{
                  main = "yzld2002.cn";
                  sans = ["*.yzld2002.cn"];
                }];
              };
            };
          };
        };
        serversTransport = {
          insecureSkipVerify = true;
        };
        certificatesResolvers = {
          tencentcloud = {
            acme = {
              email = "yzld2002@gmail.com";
              storage = "/var/lib/traefik/acme.json";
              dnsChallenge = {
                provider = "tencentcloud";
              };
            };
          };
        };
        # providers = {
        #   kubernetesIngress = {
        #     endpoint = "https://127.0.0.1:6443";
        #     # kubectl describe secrets traefik-manual-token
        #     token = "eyJhbGciOiJSUzI1NiIsImtpZCI6IlNzcE5hck1oY2pRcjU2UE5qb2VQR3pmR2plaXptY3lodGlyZTctaGxfVGsifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6InRyYWVmaWstbWFudWFsLXRva2VuIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6InRyYWVmaWstYWNjb3VudCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjgyNjhkOWQ4LWExMTgtNDUxMy1iMWQxLWYxMDhlMzEwYzE5OCIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZWZhdWx0OnRyYWVmaWstYWNjb3VudCJ9.DgjAjlFNbGnTYWnR_Q2k4zZSZ1p47L_MZrjTM84Ng_yll40uNUeI4b91e_Fr1ZW3sDlgdl-0hxtBy3fofZCM8Zk1WfHKCil9jWTfBnAOOF3mycZzAK7j5_9y-BgK0q2nUllatew--SiCLqFW4xwFmeNvXurKIVGTW0myg7XQFKzbpbYQSiO0WdivhjQa-Um2dlrHnWetWl6ENxI0g-to80ltRKLjrn8mVKy1Cv1CEhPL5aIlIjh9O022Ama6O2cki_G1Al750_0xd0a7WSGvaiqPxMq35wBgkJgWNK-4mNFS-o1VvBwwHpzlxJjLSe16eTkBt0r190qoKZ8Umn-ZlQ";
        #     # cp /var/lib/rancher/k3s/server/tls/server-ca.crt /var/lib/traefik && chown traefik:traefik /var/lib/traefik/server-ca.crt
        #     certAuthFilePath = "/var/lib/traefik/server-ca.crt";
        #     ingressEndpoint = {
        #       hostname = "yzld2002.cn";
        #       ip = "192.168.50.21";
        #     };
        #   };
        # };
      };
      dynamicConfigFile = ./dynamic_conf.yaml;
    };
  };
}
