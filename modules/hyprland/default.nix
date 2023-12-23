{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.hyprland;


in {
  imports = [ ./mako ./waybar ./wofi ];
  options.modules.hyprland= { enable = mkEnableOption "hyprland"; };
  config = mkIf cfg.enable {
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 18;
    };
    home.packages = with pkgs; [
      wl-clipboard mpc-cli pamixer swaylock
    ];
    services.mpd.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      extraConfig = ''
        # PA329CV for m600
        monitor=,preferred,auto,1.5
        
        exec-once = waybar & mako
        
        # Source a file (multi-file configs)
        # source = ~/.config/hypr/myColors.conf
        
        $terminal = kitty
        $menu = wofi --normal-window drun
        
        env = XCURSOR_SIZE,18
        env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that
        
        # unscale XWayland
        xwayland {
          force_zero_scaling = true
        }
        
        input {
            kb_layout = us
            kb_variant =
            kb_model =
            kb_options = ctrl:nocaps
            kb_rules =
        
            follow_mouse = 1
        
            touchpad {
                natural_scroll = false
            }
        
            sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        }
        
        general {
            layout = dwindle
        
            gaps_in = 5
            gaps_out = 20
            border_size = 2
            col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
            col.inactive_border = rgba(595959aa)
        }
        
        decoration {
            rounding = 10
        
            blur {
                enabled = true
                size = 3
                passes = 1
                
                vibrancy = 0.1696
            }
        }
        
        animations {
            enabled = true
        
            # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        
            bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        
            animation = windows, 1, 7, myBezier
            animation = windowsOut, 1, 7, default, popin 80%
            animation = border, 1, 10, default
            animation = borderangle, 1, 8, default
            animation = fade, 1, 7, default
            animation = workspaces, 1, 6, default
        }
        
        dwindle {
            pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = true # you probably want this
        }
        
        gestures {
            workspace_swipe = false
        }
        
        misc {
            force_default_wallpaper = -1 # Set to 0 to disable the anime mascot wallpapers
        }
        
        # Example windowrule v1
        # windowrule = float, ^(kitty)$
        # Example windowrule v2
        # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
        # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
        windowrulev2 = nomaximizerequest, class:.* # You'll probably like this.
        windowrulev2 = stayfocused,class:(wofi)
        windowrulev2 = noborder,class:(wofi)
        
        
        # See https://wiki.hyprland.org/Configuring/Keywords/ for more
        $mainMod = ALT
        
        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        bind = $mainMod, Q, exec, $terminal
        bind = $mainMod, C, killactive,
        bind = $mainMod, M, exit,
        bind = $mainMod, V, togglefloating,
        bind = $mainMod, R, exec, $menu
        bind = $mainMod, P, pseudo, # dwindle
        bind = $mainMod, J, togglesplit, # dwindle
        
        # Move focus with mainMod + arrow keys
        bind = $mainMod, left, movefocus, l
        bind = $mainMod, right, movefocus, r
        bind = $mainMod, up, movefocus, u
        bind = $mainMod, down, movefocus, d
        
        # Switch workspaces with mainMod + [0-9]
        bind = $mainMod, 1, workspace, 1
        bind = $mainMod, 2, workspace, 2
        bind = $mainMod, 3, workspace, 3
        bind = $mainMod, 4, workspace, 4
        bind = $mainMod, 5, workspace, 5
        bind = $mainMod, 6, workspace, 6
        bind = $mainMod, 7, workspace, 7
        bind = $mainMod, 8, workspace, 8
        bind = $mainMod, 9, workspace, 9
        bind = $mainMod, 0, workspace, 10
        
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        bind = $mainMod SHIFT, 1, movetoworkspace, 1
        bind = $mainMod SHIFT, 2, movetoworkspace, 2
        bind = $mainMod SHIFT, 3, movetoworkspace, 3
        bind = $mainMod SHIFT, 4, movetoworkspace, 4
        bind = $mainMod SHIFT, 5, movetoworkspace, 5
        bind = $mainMod SHIFT, 6, movetoworkspace, 6
        bind = $mainMod SHIFT, 7, movetoworkspace, 7
        bind = $mainMod SHIFT, 8, movetoworkspace, 8
        bind = $mainMod SHIFT, 9, movetoworkspace, 9
        bind = $mainMod SHIFT, 0, movetoworkspace, 10
        
        # Example special workspace (scratchpad)
        bind = $mainMod, S, togglespecialworkspace, magic
        bind = $mainMod SHIFT, S, movetoworkspace, special:magic
        
        # Scroll through existing workspaces with mainMod + scroll
        bind = $mainMod, mouse_down, workspace, e+1
        bind = $mainMod, mouse_up, workspace, e-1
        
        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = $mainMod, mouse:272, movewindow
        bindm = $mainMod, mouse:273, resizewindow
      '';
    };
  };
}
