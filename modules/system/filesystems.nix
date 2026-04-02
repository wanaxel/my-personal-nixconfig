{ config, pkgs, ... }:

{
  # ==========================
  # Extra Mounts
  # ==========================
  fileSystems."/mnt/games" = {
    device = "/dev/nvme0n1p1";
    fsType = "ext4";

    options = [
      "nofail"
      "noatime"
      "nodiratime"
      "x-systemd.automount"
      "x-systemd.device-timeout=10"
    ];
  };
}
