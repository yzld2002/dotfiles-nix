{
  description = "NixOS configuration";

  # All inputs for the system
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  # All outputs for the system (configs)
  outputs = { self,nixpkgs, home-manager, ... }@inputs: 
    let
    inherit (self) outputs;
    mkSystem = pkgs: system: hostname:
      let
        systemconfig = ./hosts/${name}/default.nix;
        hardwareconfig = ./hosts/${name}/hardware-configuration.nix;
        homeconfig = ./hosts/${name}/home.nix;
      in
        pkgs.lib.nixosSystem {
          system = system;
          modules = [
            systemconfig
            hardwareconfig
            ./nixos/system.nix
            { nixpkgs.config.allowUnfree = true; }
            { networking.hostName = hostname; }
            # General configuration (users, networking, sound, etc)
            ./modules/system/configuration.nix
            # Hardware config (bootloader, kernel modules, filesystems, etc)
            (./. + "/hosts/${hostname}/hardware-configuration.nix")
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                extraSpecialArgs = { inherit inputs; };
                users.yzld2002 = (./. + "/hosts/${hostname}/user.nix");
              };
            }
          ];
          specialArgs = { inherit inputs; };
        };

  in {
    nixosConfigurations = {
      m600 = mkSystem inputs.nixpkgs "x86_64-linux" "m600";
    };
  };
}
