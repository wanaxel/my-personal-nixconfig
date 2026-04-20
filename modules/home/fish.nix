{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      update = "sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    };

    interactiveShellInit = ''
      if test -z "$FISH_VERSION"
        exec fish
      end
      set -g fish_greeting ""
      set -gx EDITOR nvim
      fish_add_path /home/axel/.opencode/bin
      if type -q starship
        starship init fish | source
      end
    '';

    plugins = [
      { name = "autopair"; src = pkgs.fishPlugins.autopair; }
      { name = "z"; src = pkgs.fishPlugins.z; }
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish; }
    ];
  };
}
