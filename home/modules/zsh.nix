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
      plugins = [ "z" "extract" "fzf" "git" ];
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
    initExtra = ''
      export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD')
    '';
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.bat.enable = true;
}
