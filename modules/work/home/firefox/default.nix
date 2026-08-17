{ ... }:
let
  outlookUrl = "https://outlook.cloud.microsoft/";
in
{
  programs.firefox = {
    policies = {
      Handler.schemes.mailTo.handlers = [
        {
          name = "Outlook";
          urlTemplate = outlookUrl;
        }
      ];
      Permissions = {
        Notifications = {
          Allow = [
            outlookUrl
            "https://gitlab.hornetsecurity.com/"
            "https://gitlabdev.internal.hornetsecurity.com/"
          ];
          Locked = true;
        };
      };
    };

    profiles.toepper.bookmarks.settings = [
      {
        name = "Angular";
        url = "https://angular.dev/overview/";
      }
      {
        name = "Argo dev";
        url = "https://argocd-base-d-k8s10-hz1.hornetsecurity.com/applications/argocd/sas-cp-module-sas-cp-module/";
      }
      {
        name = "Confluence";
        url = "https://hornetsecurity.atlassian.net/wiki/spaces/~71202057f4f674c427493d9ffeaa613e7b0358/overview/";
      }
      {
        name = "cptest2";
        url = "https://cptest2.hornetsecurity.com/";
      }
      {
        name = "Gitlab";
        url = "https://gitlabdev.internal.hornetsecurity.com/";
      }
      {
        name = "Hive";
        url = "https://hive.hornetsecurity.com/";
      }
      {
        name = "Jira";
        url = "https://hornetsecurity.atlassian.net/jira/dashboards/13221/";
      }
      {
        name = "Legacy Gitlab";
        url = "https://gitlab.hornetsecurity.com/";
      }
      {
        name = "Outlook";
        url = outlookUrl;
      }
      {
        name = "Personio";
        url = "https://hornetsecurity.app.personio.com/";
      }
      {
        name = "Pyxis design";
        url = "https://www.figma.com/design/VxdDAqHQRiS0PZKqr9Um0E/%F0%9F%93%9A-Pyxis---Documentation?node-id=2-2&p=f&t=aCOBpQsI8CzTud2E-0";
      }
      {
        name = "Pyxis storybook";
        url = "http://localhost:8102/";
      }
      {
        name = "RxJS";
        url = "https://rxjs.dev/guide/overview/";
      }
      {
        name = "SE - Help Center";
        url = "https://hornetsecurity.atlassian.net/servicedesk/customer/portals/";
      }
    ];
  };
}
