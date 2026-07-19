{
  description = "Main NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: 
  let 
    system = "x86_64-linux";
    username = "manuel";

    mkHost = hostname: nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ ./hosts/${hostname}/configuration.nix ];
      specialArgs = { inherit username inputs; };
    };
  in
  {
    nixosConfigurations = {
      clover = mkHost "clover";
      sam = mkHost "sam";
    };
  };
}
