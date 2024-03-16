{pkgs, ...}: {
  # ZSH stuff
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting = { enable = true; };
    oh-my-zsh = {
      enable = true;
      plugins = [ "z" "extract" "fd" "fzf" "git" ];
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
}
