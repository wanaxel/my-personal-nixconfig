{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      background_opacity = "0.65";
      font_family = "JetBrainsMono Nerd Font";
      font_size = 12;
    };
  };
}
