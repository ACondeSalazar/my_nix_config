{ pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    brightnessctl
    inputs.zen-browser.packages.${pkgs.system}.default
    yazi
    gcc
    btop
  ];
}
