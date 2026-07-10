{
  description = "Main Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
  let
    customHost = { user, hostname, configPath }: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit hostname user; };
      modules = [
        ./hosts/${configPath}/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit hostname user; };
        }
      ];
    };
  in
  {
    nixosConfigurations = {
      clover = customHost { user = "manuel"; hostname = "nixos-clover"; configPath = "clover"; };
    };
  };
}
