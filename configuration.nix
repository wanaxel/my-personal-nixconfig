{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # System
    ./modules/system/core.nix
    ./modules/system/networking.nix
    ./modules/system/users.nix
    ./modules/system/filesystems.nix
    ./modules/system/boot.nix

    # Programs
    ./modules/programs/audio.nix
    ./modules/programs/packages.nix
    
    # Desktop
    ./modules/desktop/gaming.nix
    ./modules/desktop/plasma.nix
  ];
}
