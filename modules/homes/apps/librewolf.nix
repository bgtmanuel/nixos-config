{ ... }:
{
  programs.librewolf.enable = true;
  programs.librewolf.profiles.manuel = {

    isDefault = true;
    id = 0;

    search.default = "google";
    search.force = true;

    bookmarks = {
      force = true;
      settings = [
        { name = "Youtube"; url = "https://www.youtube.com"; }
        { name = "Twitch"; url = "https://www.twitch.tv"; }
        { name = "Gmail"; url = "https://mail.google.com"; }
        { name = "Proton Mail"; url = "https://mail.proton.me"; }
      ];
    };

    settings = {
      "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
      "browser.theme.toolbar-theme" = 0;
      "ui.systemUsesDarkTheme" = 1;

      "network.trr.mode" = 2;
      "network.trr.uri" = "https://dns.quad9.net/dns-query";
      "network.trr.bootstrapAddress" = "9.9.9.9";
      
      "browser.search.suggest.enabled" = true;
      "browser.urlbar.suggest.searches" = true;

      "browser.tabs.warnOnClose" = true;
      "browser.tabs.insertAfterCurrent" = true;

      "privacy.resistFingerprinting" = false;
     	"privacy.fingerprintingProtection"=true;

      "media.peerconnection.enabled" = true;

      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;

      "browser.startup.page" = 3;

      "webgl.disabled" = false;
    };
  };

  programs.librewolf.policies = {
    ExtensionSettings = {
      "ATBC@EasonWong" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/adaptive-tab-bar-colour/latest.xpi";
        installation_mode = "force_installed";
      };
      "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
        installation_mode = "force_installed";
      };
    };
  };
}