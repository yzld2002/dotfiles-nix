{...}: {
  imports = [
    ../../home/default.nix
  ];

  # Enable profiles
  hosts.work.enable = true;
  home.file."dockge/compose.yaml" = {
    source = ./modules/dockge/compose.yaml;
  };
}
