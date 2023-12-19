{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.zsh;
in {
  options.modules.zsh = { enable = mkEnableOption "zsh"; };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.zsh
    ];
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
    };
    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "z" "extract" ];
      };
      shellAliases = {
        vim = "nvim";
        cat = "bat";
        kg = "kubectl get";
        kd = "kubectl describe";
        ke = "kubectl edit";
        kl = "kubectl logs";
        lz = "lazygit";
      };
    };
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    programs.bat.enable = true;
  };
}
