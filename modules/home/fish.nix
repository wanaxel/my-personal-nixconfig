{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    # ==========================
    # Shell aliases
    # ==========================
    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      update = "sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    };

    # ==========================
    # Shell init
    # ==========================
    interactiveShellInit = ''
      # Force fish if somehow bash starts
      if test -z "$FISH_VERSION"
        exec fish
      end

      # Greeting
      set -g fish_greeting ""

      # Editor
      set -gx EDITOR nvim

      # Starship (optional)
      if type -q starship
        starship init fish | source
      end
    '';

    # ==========================
    # Plugins
    # ==========================
    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair;
      }
      {
        name = "z";
        src = pkgs.fishPlugins.z;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish;
      }
    ];
  };
}
