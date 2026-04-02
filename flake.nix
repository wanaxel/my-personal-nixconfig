{
  description = "Axel's NixOS config (cleaned)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, cachyos-kernel, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./configuration.nix

        # Home Manager
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            users.axel = import ./home.nix;
          };
        }

        # CachyOS Kernel
        ({ pkgs, ... }: {
          boot.kernelPackages =
            pkgs.linuxPackagesFor
              cachyos-kernel.packages.${pkgs.system}.linux-cachyos-latest-x86_64-v4;
        })
      ];
    };
  };
}
