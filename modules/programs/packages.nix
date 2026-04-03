{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    steam
    vulkan-tools
    mesa
    flatpak
    neovim
    mpv
    wineWow64Packages.staging 
    winetricks
    lutris
    qbittorrent
    git
    protonup-qt
    libreoffice-qt-fresh
  ];

  programs = {
    firefox.enable = true;
    fish.enable = true;
    nix-ld.enable = true;
  };

  # ========================
  # Services
  # ========================
  services.printing.enable = true;
}
