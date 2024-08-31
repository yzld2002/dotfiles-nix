{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    agenix,
    nix-index-database,
    nixos-wsl,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "x86_64-linux"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;

    # Abstract generating system code here
    mkSystem = name: {system}: let
      # The config files for this system.
      systemconfig = ./hosts/${name}/default.nix;
      hardwareconfig = ./hosts/${name}/hardware.nix;
      homeconfig = ./hosts/${name}/home.nix;
    in
      with nixpkgs.lib;
        nixosSystem {
          specialArgs = {inherit inputs outputs;};
          modules = [
            systemconfig
            hardwareconfig

            # Base NixOS configuration
            ./nixos/system.nix

            # Secret management
            agenix.nixosModules.default
            {
              environment.systemPackages = [agenix.packages.${system}.default];
            }

            home-manager.nixosModules.home-manager
            {
              home-manager.useUserPackages = true;
              home-manager.users.yzld2002 = import homeconfig;
              home-manager.extraSpecialArgs = {inherit inputs outputs;};
            }
          ];
        };
  in {
    # Formatter for your nix files, available through 'nix fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # wsl is a bit different, use a minimal config first
    nixosConfigurations.m600-wsl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
	nixos-wsl.nixosModules.default
	{
	  system.stateVersion = "24.05";
	  wsl.enable = true;
	  wsl.defaultUser = "yzld2002";
	}
	./nixos/system.nix
	./hosts/m600-wsl/default.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useUserPackages = true;
          home-manager.users.yzld2002 = import ./hosts/m600-wsl/home.nix;
          home-manager.extraSpecialArgs = {inherit inputs outputs;};
        }
        # Secret management
        agenix.nixosModules.default
        {
          environment.systemPackages = [agenix.packages.x86_64-linux.default];
        }
      ];
    };
    nixosConfigurations.ms04-nix = mkSystem "ms04-nix" {
      system = "x86_64-linux";
    };
  };
}
