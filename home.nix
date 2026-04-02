{ config, pkgs, ... }:

{
  home.username = "axel";
  home.homeDirectory = "/home/axel";
  home.stateVersion = "25.11";

  imports = [
    ./modules/home/git.nix
    ./modules/home/fish.nix
    ./modules/home/kitty.nix
  ];
}
