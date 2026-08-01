{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" ];
    extraPackages = [ pkgs.nixd pkgs.clang-tools ];
  };
}
