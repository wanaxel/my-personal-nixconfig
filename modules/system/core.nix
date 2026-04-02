{ config, pkgs, ... }:

{
  system.stateVersion = "25.11";

  time.timeZone = "Asia/Makassar";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
}
