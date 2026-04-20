{ inputs, config, pkgs, lib, ... }:
{
  
  imports = [ inputs.silentSDDM.nixosModules.default ];
  programs.silentSDDM = {
    enable = true;
    theme = "rei";
  };

  services.displayManager.sddm.wayland.enable = lib.mkForce true;
}
