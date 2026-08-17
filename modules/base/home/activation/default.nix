{ lib, pkgs, ... }: {
  home = {
    packages = with pkgs; [ defaultbrowser ];

    activation = {
      set-default-apps = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        ${pkgs.defaultbrowser}/bin/defaultbrowser firefox
      '';
    };
  };
}
