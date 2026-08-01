{ ... }: {
  home.file.".config/hypr/hyprpaper.conf".text = ''
    splash = false
    ipc = on

    preload = /home/toasti/Documents/theme/stranding.png

    wallpaper {
        monitor = eDP-1
        path = /home/toasti/Documents/theme/stranding.png
        fit_mode = contain
    }
  '';

  programs.rofi.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "exec-once" = [
        "noctalia-shell"
        "hyprpaper"
      ];

      monitor = [ ",preferred,auto,1.0" ];

      input = {
        kb_layout = "fr";
        touchpad.natural_scroll = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
      };

      decoration.rounding = 10;

      animations = {
        enabled = true;
        bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      "$mod" = "SUPER";

      bind = [
        "$mod, T, exec, foot"
        "$mod, W, exec, zen"
        "$mod, C, exec, zeditor"
        "$mod, E, exec, foot -e ranger"

        "$mod, Space, exec, rofi -show drun"

        "$mod, M, exit,"
        "$mod, Q, killactive,"
        "$mod, F, fullscreen,"
        "$mod, Return, togglefloating,"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, down, movefocus, d"
        "$mod, up, movefocus, u"
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"

        "CTRL ALT, right, workspace, +1"
        "CTRL ALT, left, workspace, -1"
        "CTRL ALT SHIFT, right, movetoworkspace, +1"
        "CTRL ALT SHIFT, left, movetoworkspace, -1"
      ];

      binde = [
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
