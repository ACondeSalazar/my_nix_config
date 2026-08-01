{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting

      alias ls='eza --icons --group-directories-first -1'

      abbr -e rebuild
      abbr rebuild 'sudo nixos-rebuild switch --flake /etc/nixos#personal'
      abbr regen-hw 'sudo nixos-generate-config --show-hardware-config | sudo tee /etc/nixos/hosts/personal/hardware-configuration.nix'
      abbr l 'ls'
      abbr ll 'ls -l'
      abbr la 'ls -a'
      abbr lla 'ls -la'

      function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
      end

      # micromamba: env vars set eagerly, shell hook loaded lazily on first call
      set -gx MAMBA_EXE "${pkgs.micromamba}/bin/micromamba"
      set -gx MAMBA_ROOT_PREFIX "$HOME/micromamba"
      function micromamba
        functions -e micromamba
        eval ($MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | string collect)
        micromamba $argv
      end
    '';
  };

  programs.starship.enable = true;

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ];
  };
}
