{
  description = "Main Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
  
    let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
  
    {

    nixosConfigurations.asus = nixpkgs.lib.nixosSystem {

      inherit system;

      modules = [
        
        ./modules/hosts/asus/asus.nix
        ./modules/hosts/asus/asus-hardware-configuration.nix
        ./modules/system/bootloader/limine.nix
        ./modules/system/desktop-environnement/gnome.nix
        ./modules/system/shell/fish.nix
        ./modules/system/services/printing.nix
        
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.manuel = ./modules/homes/manuel.nix;
          home-manager.backupFileExtension = "bak";
        }
      ];
    };

    devShells.${system} = {
      python = import ./modules/dev-shells/python.nix { inherit pkgs; };
    };

  };
}
