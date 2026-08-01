{ inputs, ... }: {
  imports = [
    inputs.noctalia.homeModules.default
    ./shell.nix
    ./desktop.nix
    ./editors.nix
    ./terminal.nix
    ./packages.nix
  ];

  programs.noctalia-shell.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
