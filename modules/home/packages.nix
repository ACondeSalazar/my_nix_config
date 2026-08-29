{ pkgs, ... }: {
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    eza
    hyprpaper
    micromamba
    ncdu
    quickshell
    hyprshot
  ];
}
