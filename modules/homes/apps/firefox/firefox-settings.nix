{ ... }:
{
  programs.firefox.policies = {
    AIControls = {
      Default         = { Value = "blocked"; Locked = true; };
      SidebarChatbot  = { Value = "blocked"; Locked = true; };
      Translations    = { Value = "blocked"; Locked = true; };
      PDFAltText      = { Value = "blocked"; Locked = true; };
      SmartTabGroups  = { Value = "blocked"; Locked = true; };
      LinkPreviewKeyPoints = { Value = "blocked"; Locked = true; };
      SmartWindow     = { Value = "blocked"; Locked = true; };
    };
    DisableTelemetry = true;
    DisableFirefoxStudies = true;
    DisableFirefoxAccounts = true;
    PasswordManagerEnabled = false;
    OfferToSaveLogins = false;
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
    DisablePocket = true;
    DisableFormHistory = true;
    DisableFeedbackCommands = true;
    EnableTrackingProtection = {
      Value            = true;
      Locked           = true;
      Cryptomining     = true;
      Fingerprinting   = true;
    };
    DNSOverHTTPS = {
      Enabled            = true;
      ProviderURL        = "https://cloudflare-dns.com/dns-query";
      Locked             = false;
      Fallback           = true;
      ExcludedDomains    = [];
    };
    FirefoxHome = {
      Search              = true;
      TopSites            = false;
      SponsoredTopSites   = false;
      Highlights          = false;
      Pocket              = false;
      SponsoredPocket     = false;
      Snippets            = false;
      Locked              = false;
    };
    UserMessaging = {
      WhatsNew               = false;
      ExtensionRecommendations = false;
      FeatureRecommendations = false;
      UrlbarInterventions    = true;
      SkipOnboarding         = true;
      MoreFromMozilla        = false;
      Locked                 = false;
    };
    FirefoxSuggest = {
      WebSuggestions       = false;
      SponsoredSuggestions = false;
      ImproveSuggest       = false;
      Locked               = true;
    };
    DisplayBookmarksToolbar = "always";
    NetworkPrediction = false;
    DontCheckDefaultBrowser = true;
    OverrideFirstRunPage = "";
    OverridePostUpdatePage = "";
    Cookies = {
      Behavior               = "reject-tracker-and-partition-foreign";
      BehaviorPrivateBrowsing = "reject-tracker-and-partition-foreign";
      Locked                 = false;
    };
    ManagedBookmarks = [
      {
        toplevel_name = "Favoris";
      }
      {
        name      = "YouTube";
        url       = "https://www.youtube.com";
      }
      {
        name      = "Twitch";
        url       = "https://www.twitch.tv";
      }
      {
        name      = "Gmail";
        url       = "https://mail.google.com";
      }
      {
        name      = "Proton Mail";
        url       = "https://mail.proton.me";
      }
    ];
  };
  programs.firefox.profiles.default.settings = {
    "browser.newtabpage.activity-stream.enabled"             = false;
    "browser.newtabpage.activity-stream.feeds.telemetry"     = false;
    "browser.newtabpage.activity-stream.telemetry"           = false;
    "browser.newtabpage.activity-stream.feeds.snippets"      = false;
    "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
    "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
    "browser.newtabpage.activity-stream.showSponsored"       = false;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    "browser.newtabpage.activity-stream.default.sites"       = "";
    "geo.enabled" = false;
  };
}