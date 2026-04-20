{ config, pkgs, ... }:
{
  
  users.users.axel = {
    isNormalUser = true;
    description = "axel";
    extraGroups = [ "wheel" "networkmanager" "input" "plugdev" ];
    shell = pkgs.fish;
  };
  
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="c365", MODE="0660", GROUP="input"
  '';
}
