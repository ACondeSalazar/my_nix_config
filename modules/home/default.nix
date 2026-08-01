{ ... }: {
  imports = [
    ./shell.nix
    ./desktop.nix
    ./editors.nix
    ./terminal.nix
    ./packages.nix
    ./git.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
