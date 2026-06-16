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
      bookmarks = {
        force = true; 
        settings = [
          {
            name = "Bash"; 
            url = "https://www.gnu.org/software/bash/manual/bash.html";
          }
          {
            name = "Docker"; 
            url = "https://docs.docker.com/";
          }
          {
            name = "Faker";
            url = "https://fakerjs.dev/api/";
          }
          {
            name = "Git"; 
            url = "https://git-scm.com/docs";
          }
          {
            name = "Localhost";
            url = "http://localhost:4200/";
          }
          {
            name = "Lodash";
            url = "https://lodash.com/docs/";
          }
          {
            name = "Lua";
            url = "https://www.lua.org/manual/5.5/";
          }
          {
            name = "MDN";
            url = "https://developer.mozilla.org/";
          }
          {
            name = "Moment.js";
            url = "https://momentjs.com/docs/";
          }
          {
            name = "MSW";
            url = "https://mswjs.io/docs/";
          }
          {
            name = "MSW data";
            url = "https://github.com/mswjs/data/";
          }
          {
            name = "Nix"; 
            url = "https://nix.dev/manual/nix/2.34/";
          } 
          {
            name = "Node.js";
            url = "https://nodejs.org/docs/latest/api/";
          }
          {
            name = "Nginx";
            url = "https://nginx.org/en/docs/";
          }
          {
            name = "Pnpm";
            url = "https://pnpm.io/motivation/";
          }
          {
            name = "RabbitMQ";
            url = "https://www.rabbitmq.com/docs/";
          }
          {
            name = "React"; 
            url = "https://react.dev/";
          }
          {
            name = "SCSS";
            url = "https://sass-lang.com/documentation/";
          }
          {
            name = "Tailwind";
            url = "https://tailwindcss.com/docs/";
          }
          {
            name = "TypeScript";
            url = "https://www.typescriptlang.org/docs/";
          }
          {
            name = "Vite";
            url = "https://vite.dev/config/";
          }
          {
            name = "Vitest";
            url = "https://vitest.dev/guide/";
          }
          {
            name = "Zod";
            url = "https://zod.dev/";
          }
        ];
      }; 
    };
  };
}
