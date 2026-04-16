{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 20;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.kernelModules = ["i2c-dev"];
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.kernelParams = [
  "nvme_core.default_ps_max_latency_us=0"
  "nvme_core.io_timeout=30"
  ];
}
