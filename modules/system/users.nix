{ config, pkgs, ... }:

{
  users.users.axel = {
    isNormalUser = true;
    description = "axel";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };
}
