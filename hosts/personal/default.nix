{ inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/session.nix
    ../../modules/nixos/packages.nix
  ];

  networking.hostName = "personal";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.toasti = import ../../modules/home/default.nix;
  };

  system.stateVersion = "25.11";
}
