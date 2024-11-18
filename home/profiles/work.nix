{ config
, lib
, pkgs
, inputs
, ...
}:
with lib; let
  cfg = config.hosts.work;
in
{
  options.hosts.work = {
    enable = mkEnableOption "Enable packages and configuration specfic to work";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gcc
      gccStdenv
      tree-sitter
      nodejs
      nodePackages.eslint
      rustc
      cargo
      clippy
      rustfmt
      rust-analyzer
      go
      ghc
      lua
      stylua
      poetry
      python311
      kubectl
      kubie
      kubernetes-helm-wrapped
      argocd
      krew
      kompose
      jdk
      kotlin
      postgresql
      docker-compose
    ];
  };
}
