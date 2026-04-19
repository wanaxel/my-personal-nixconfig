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
    google-chrome
    easyeffects
    obs-studio
    wget 
    zenity
    unzip
    xdg-desktop-portal-gtk
    opentabletdriver
    heroic
    osu-lazer-bin
    protontricks
    pcsx2
    unrar
    nvme-cli
    openrgb
    openrgb-with-all-plugins
    mission-center
    steamcmd
    gamescope
    parted
    brave
  ];

  programs = {
    firefox.enable = true;
    fish.enable = true;
    nix-ld.enable = true;
  };

  programs.gamescope = {
  enable = true;
  capSysNice = true;  
};

  # ========================
  # Services
  # ========================
  services.printing.enable = true;
  services.flatpak.enable = true; 
  xdg.portal.enable = true;
  programs.gamemode.enable = true;
}
