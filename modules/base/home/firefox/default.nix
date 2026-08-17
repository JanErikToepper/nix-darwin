{ ... }: {
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];
    policies = {
      AppAutoUpdate = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "never";
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      Extensions = {
        Install = [ "https://addons.mozilla.org/firefox/downloads/file/4717567/vimium_ff-2.4.2.xpi" ];
        Locked = [ "https://addons.mozilla.org/firefox/downloads/file/4717567/vimium_ff-2.4.2.xpi" ];
      };
      ExtensionUpdate = false;
      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        Stories = false;
        SponsoredPocket = false;
        SponsoredStories = false;
        Snippets = false;
        Locked = true;
      };
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
        Locked = true;
      };
      Handler = {
        schemes = {
          mailTo = {
            action = "useHelperApp";
            ask = false;
          };
        };
      };
      Homepage = {
        URL = "https://vimium.github.io/new-tab/";
        Locked = true;
        StartPage = "homepage-locked";
      };
      ManualAppUpdateOnly = true;
      NetworkPrediction = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      OverrideFirstRunPage = "";
      PasswordManagerEnabled = false;
      Preferences = {
        "browser.sessionstore.resume_from_crash" = false;
      };
      PDFjs = {
        Enabled = true;
        EnabledPermissions = true;
      };
      PictureInPicture = {
        Enabled = false;
        Locked = true;
      };
      PopupBlocking = {
        Default = false;
        Locked = true;
      };
      PostQuantumKeyAgreementEnabled = true;
      PromptForDownloadLocation = false;
      SearchEngines = {
        PreventInstalls = true;
      };
      ShowHomeButton = false;
      SkipTermsOfUse = true;
      TranslateEnabled = false;
      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboarding = false;
        MoreFromMozilla = false;
        FirefoxLabs = false;
        Locked = true;
      };
    };

    profiles.toepper = {
      settings = {
        "browser.startup.homepage" = "https://vimium.github.io/new-tab/";
        "browser.startup.page" = 1;
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "Bash";
            url = "https://www.gnu.org/software/bash/manual/bash.html";
          }
          {
            name = "devenv";
            url = "https://devenv.sh/";
          }
          {
            name = "Docker";
            url = "https://docs.docker.com/";
          }
          {
            name = "Git";
            url = "https://git-scm.com/docs";
          }
          {
            name = "Java";
            url = "https://docs.oracle.com/en/java/javase/26/";
          }
          {
            name = "Localhost";
            url = "http://localhost:8080/";
          }
          {
            name = "Maven Repository";
            url = "https://mvnrepository.com/";
          }
          {
            name = "Lua";
            url = "https://www.lua.org/manual/5.5/";
          }
          {
            name = "Nix";
            url = "https://nix.dev/manual/nix/2.34/";
          }
          {
            name = "nginx";
            url = "https://nginx.org/en/docs/";
          }
          {
            name = "RabbitMQ";
            url = "https://www.rabbitmq.com/docs/";
          }
          {
            name = "Spring Boot";
            url = "https://docs.spring.io/spring-boot/index.html";
          }
        ];
      };
    };
  };
}
