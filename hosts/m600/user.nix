{ config, lib, inputs, ...}:

{
  imports = [
    ../../modules/default.nix
    ./secret.nix
  ];
  config.modules = {
    # gui
    hyprland.enable = true;
    kitty.enable = true;
    gui.enable = true;

    # cli
    zsh.enable = true;
    git.enable = true;
    gpg.enable = true;
    direnv.enable = true;
    neovim.enable = true;

    # system
    packages.enable = true;
  };
  home.sessionVariables = {
    PROMPT_EOL_MARK="⏎";
    MANPAGER="sh -c 'col -bx | bat -l man -p'";
    EDITOR="nvim";
  };
}
