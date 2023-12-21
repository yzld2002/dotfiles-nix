{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.dev;

in {
  options.modules.kitty = { enable = mkEnableOption "dev"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gcc gccStdenv
      tree-sitter ripgrep
      nodejs nodePackages.eslint
      rustc cargo clippy rustfmt
      go
      ghc
      lua stylua
      kubectl kubie kubernetes-helm-wrapped argocd krew kompose
    ]
  };
}

