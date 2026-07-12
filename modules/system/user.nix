{ config, pkgs, username, inputs, ... }:
{
  # Module de configuration de Home-Manager récupéré depuis le flake
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  # Ajout d'un utilisateur
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "wheel" ]; # Voir également ./connectivity.nix
  };

  # Configuration de home-manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    overwriteBackup = true;
    extraSpecialArgs = { inherit username inputs; };
  };
}