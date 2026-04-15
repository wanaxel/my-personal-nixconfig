{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.desktopManager.plasma6.enable = true;
  systemd.user.services.easyeffects = {
  description = "EasyEffects";
  wantedBy = [ "default.target" ];
  serviceConfig = {
    ExecStart = "${pkgs.easyeffects}/bin/easyeffects --gapplication-service";
    Restart = "on-failure";
  };
};
}
