{...}: {
  imports = [
    ../../home/default.nix
  ];

  # Enable profiles
  hosts.desktop.enable = true;
  hosts.work.enable = true;
}