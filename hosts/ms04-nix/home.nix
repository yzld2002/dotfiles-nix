{...}: {
  imports = [
    ../../home/default.nix
  ];

  # Enable profiles
  hosts.work.enable = true;
  home.file."dockge/compose.yaml" = {
    source = ./modules/dockge/compose.yaml;
  };
  home.file."dockge/stacks" = {
    source = ./modules/dockge/stacks;
    recursive = true;
  };
}
