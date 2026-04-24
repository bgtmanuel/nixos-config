{ ... }:
{
  programs.librewolf.enable = true;
  # manuel.bagot@protonmail.com
  programs.librewolf.profiles.manuel = {

    isDefault = true;
    id = 0;

    search.default = "google";
    search.force = true;

    settings = {      
      "browser.search.suggest.enabled" = true;
      "browser.urlbar.suggest.searches" = true;

      "browser.tabs.warnOnClose" = true;
      "browser.tabs.insertAfterCurrent" = true;

      "privacy.resistFingerprinting" = false;
     	"privacy.fingerprintingProtection"=true;

      "media.peerconnection.enabled" = true;

      "browser.startup.page" = 3;

      "webgl.disabled" = false;

      "identity.fxaccounts.enabled" = true;
    };
  };
}