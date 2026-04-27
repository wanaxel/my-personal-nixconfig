{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Communication
    discord
    
    # Gaming
    steam
    lutris
    heroic
    protontricks
    protonup-qt
    wineWow64Packages.staging
    winetricks
    gamescope
    steamcmd
    steam-run
    
    # Emulation
    pcsx2
    osu-lazer-bin
    
    
    # Development
    git
    neovim
    nodejs
    python3
    icu.dev 

    # Media
    mpv
    obs-studio
    easyeffects
    strawberry
    
    # Tools
    flatpak
    lutris
    qbittorrent
    wget
    unzip
    unrar
    parted
    openrgb
    openrgb-with-all-plugins
    mission-center
    brave
    google-chrome
    libreoffice-qt-fresh
    tor-browser
    
    
    # System
    vulkan-tools
    mesa
    nvme-cli
    iputils
    procps
    shared-mime-info
    desktop-file-utils
    freetype
    vulkan-loader
    xdg-desktop-portal-gtk
    opentabletdriver
    virt-manager
    virt-viewer
    appimage-run
  ];

  programs = {
    firefox.enable = true;
    fish.enable = true;
    nix-ld.enable = true;
    gamemode.enable = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  services.printing.enable = true;
  services.flatpak.enable = true;
  xdg.portal.enable = true;
}
