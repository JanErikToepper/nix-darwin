{ lib, pkgs, ... }: {
  home.activation = {
    set-default-apps = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ${pkgs.defaultbrowser}/bin/defaultbrowser firefox
    '';
  };
}
