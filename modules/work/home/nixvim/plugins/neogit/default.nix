{ ... }: let
  gitlabDomain = "gitlabdev.internal.hornetsecurity.com";
in {
  programs.nixvim.plugins.neogit = {
    settings = {
      git_services = {
        "${gitlabDomain}" = {
          pull_request = ''https://${gitlabDomain}/''${owner}/''${repository}/merge_requests/new?merge_request[source_branch]=''${branch_name}'';
          commit = ''https://${gitlabDomain}/''${owner}/''${repository}/-/commit/''${oid}'';
          tree = ''https://${gitlabDomain}/''${owner}/''${repository}/-/tree/''${branch_name}?ref_type=heads'';
        };
      };
    };
  };
}
