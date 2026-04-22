{ ... }:
{
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.limine = {
    enable = true;
    efiSupport = true;
    extraEntries = ''
      /Windows 10
      comment: Windows 10 Boot Entry
      protocol: efi
      path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
    '';
    extraConfig = "timeout: no";
    resolution = "1920x1200";
    maxGenerations = 5;
    style = {
      wallpapers = [];
      backdrop = "000000";
      interface = {
        resolution = "1920x1200";
        helpHidden = true;
        branding = "ASUS-MANUEL";
      };
    };
  };
}
