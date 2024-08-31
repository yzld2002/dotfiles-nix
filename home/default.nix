{
  inputs,
  outputs,
  pkgs,
  config,
  lib,
  ...
}: {
  home.username = "yzld2002";
  home.homeDirectory = "/home/yzld2002";
  home.stateVersion = "24.05";

  nixpkgs = {
    config = {
      allowUnfree = true;
      # For Obsidian
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };

  imports = [
    ./modules/zsh.nix
    ./modules/neovim
    ./modules/atuin.nix

    # Packaged home manager modules
    # inputs.nixvim.homeManagerModules.nixvim

    # quickly lookup and run programs
    inputs.nix-index-database.hmModules.nix-index

    # Used by desktop but lazy loaded
    ./modules/awesomewm.nix

    # profiles based on type of computer usage
    ./profiles/desktop.nix
    ./profiles/work.nix
    ./profiles/gui-dev.nix
  ];

  # Global user level packages
  home.packages = with pkgs; [
    # shell
    fzf # A command-line fuzzy finder
    fd # easier find
    direnv # used for .envrc files
    neofetch
    fastfetch
    lsd # fance ls
    nh
    unar
    poppler # preview pdf
    xclip
    marksman
  ];
  programs.wezterm.enable = true;
  home.file.".wezterm.lua".source = ./modules/wezterm/wezterm.lua;
  # Let nix-index handle command-not-found
  programs.nix-index.enable = true;
  # Run programs with , cowsay
  programs.nix-index-database.comma.enable = true;

  # Additional direnv flake support
  programs.direnv.nix-direnv.enable = true;

  programs.git = {
    enable = true;
    userName = "yzld2002";
    userEmail = "yzld2002@gmail.com";
    diff-so-fancy.enable = true;
    extraConfig = {
      pull.rebase = "true";
      init.defaultBranch = "main";
      push.autosetupremote = "true";
    };
  };
  programs.lazygit.enable = true;
  programs.gh.enable = true;
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  systemd.user.sessionVariables = {
    GTK_IM_MODULE="ibus";
    QT_IM_MODULE="ibus";
    XMODIFIERS="@im=ibus";
  };
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
