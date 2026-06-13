{ config, ... }: {
  programs.nixvim.diagnostic.settings = {
    virtual_text.spacing = 1;
    signs = false; 
    float = {
      scope = "c"; 
      header = "";
      source = false;
      format = config.lib.nixvim.mkRaw ''
        function(d) 
          return d.message .. '  '
        end
      '';
      suffix = config.lib.nixvim.mkRaw ''
        function(d) 
          return tostring(d.code)
        end
      '';
    };
  };
}
