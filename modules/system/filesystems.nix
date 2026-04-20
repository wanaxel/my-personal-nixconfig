{ config, pkgs, ... }:

{
  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-label/games";
    fsType = "ext4";
    options = [
      "nofail"
      "noatime"
      "nodiratime"
      "errors=remount-ro"
      "x-systemd.automount"
      "x-systemd.device-timeout=10"
    ];
  };
}
