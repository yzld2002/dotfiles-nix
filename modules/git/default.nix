{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.git;

in {
  options.modules.git = { enable = mkEnableOption "git"; };
  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "yzld2002";
      userEmail = "yzld2002@gmail.com";
      diff-so-fancy.enable = true;
    };
    programs.lazygit.enable = true;
    programs.gh.enable = true;
  };
}
