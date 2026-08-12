{ ... }: {
  programs.nixvim.plugins.markview = {
    enable = true;
    settings = {
      preview.icon_provider = "devicons";
      markdown = {
        headings.__raw = "require('markview.presets').headings.glow";
        horizontal_rules.__raw = "require('markview.presets').horizontal_rules.dashed";
        tables.__raw = "require('markview.presets').tables.single";
        block_quotes.__raw = "require('markview.presets').block_quotes.obsidian";
      };
    };
  };
}
