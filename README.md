# Nixos-config

## Layout

```
hosts/personal/   host config + hardware-configuration.nix
modules/nixos/    shared system modules
modules/home/     shared home manager modules
```

## Rebuild

```sh
sudo nixos-rebuild switch --flake /etc/nixos#personal
```

Fish abbr: `rebuild`.

## New machine

1. Install NixOS, clone this flake to `/etc/nixos`
2. Regen hardware config: `regen-hw` abbr, or:
   ```sh
   sudo nixos-generate-config --show-hardware-config \
     | sudo tee /etc/nixos/hosts/personal/hardware-configuration.nix
   ```
3. `git add -A && rebuild`
