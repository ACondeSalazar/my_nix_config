{ pkgs, ... }: {
  users.users.toasti = {
    isNormalUser = true;
    description = "toasti";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    shell = pkgs.fish;
  };
}
