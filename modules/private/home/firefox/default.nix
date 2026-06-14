{ ... }: let
  outlookUrl = "https://outlook.live.com/mail/0/";
in {
  programs.firefox = {
    policies = {
      Handler.schemes.mailTo.handlers = [{
        name = "Outlook";
        urlTemplate = outlookUrl;
      }];
    };

    profiles.toepper.bookmarks.settings = [
      {
        name = "Outlook";
        url = outlookUrl;
      }
      {
        name = "GitHub";
        url = "https://github.com/";
      }   
    ];
  };
}
