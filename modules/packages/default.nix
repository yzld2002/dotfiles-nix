{ pkgs, lib, config, ... }:

with lib;
let cfg = 
config.modules.packages;
in {
  options.modules.packages = { enable = mkEnableOption "packages"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      neofetch unzip wget fd
      # dev
      gcc gccStdenv
      tree-sitter ripgrep
    ];
  };
}
