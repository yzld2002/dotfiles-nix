{...}: {
  imports = [
    ../../home/default.nix
  ];

  # Enable profiles
  hosts.work.enable = true;
  # hosts.gui-dev.enable = true;
}
