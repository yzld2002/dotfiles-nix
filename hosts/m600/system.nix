{ config, pkgs, inputs, ... }:

{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "yzld2002";
      };
      default_session = initial_session;
    };
  };
}
