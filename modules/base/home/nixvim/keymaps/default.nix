{ ... }: let
  redrawStatusLine = "vim.cmd('redrawstatus!')"; 
  stageAll = "cmd('git add --all')";
in {
  programs.nixvim = {
    globals = {
      mapleader = " "; 
      maplocalleader = " ";
    }; 

    keymaps = [
      {
        mode = "n"; 
        key = ">";
        action = "<c-w>>";
      }
      {
        mode = "n"; 
        key = "<";
        action = "<c-w><";
      }
      {
        mode = "n";  
        key = "gd";
        action = "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>";
      }
      {
        mode = "n"; 
        key = "gi";
        action = "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>";
      }
      {
        mode = "n"; 
        key = "gR";
        action = "<cmd>lua require('telescope.builtin').lsp_references()<cr>";
      }
      {
        mode = "n";
        key = "gt";
        action = "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>";
      }
      {
        mode = "n";
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover({ border = \"single\" })<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>dk";
        action = "<cmd>lua vim.diagnostic.open_float()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>dn";
        action = "<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>dp";
        action = "<cmd>lua vim.diagnostic.jump({ count = -1, float = true })<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>e";
        action = "<cmd>Oil<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>E";
        action = "<cmd>lua require('oil.actions').open_cwd.callback()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>fc";
        action = "<cmd>lua require('telescope.builtin').git_status()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>ff";
        action = "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>fg";
        action = "<cmd>lua require('telescope.builtin').live_grep()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>fh";
        action = "<cmd>lua require('telescope.builtin').help_tags()<cr>";
      }
      {
        mode = [ "n" "v" ]; 
        key = "<leader>fk";
        action = "<cmd>lua require('telescope.builtin').grep_string()<cr>";
      }
      {
        mode = "n";
        key = "<leader>fm";
        action = "<cmd>Telescope harpoon marks<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>fq";
        action = "<cmd>lua vim.cmd('cclose'); require('telescope.builtin').quickfix()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>fr";
        action = "<cmd>lua require('spectre').open()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>fs";
        action = "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>G";
        action = "<cmd>Neogit<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>ga";
        action = "<cmd>lua ${stageAll}; require('neogit').action('commit', 'amend')()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>gb";
        action = "<cmd>lua switch_branch()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>gB";
        action = "<cmd>lua cmd(\"git switch -\")<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>gc";
        action = "<cmd>lua ${stageAll}; require('neogit').action('commit', 'commit')()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>gd";
        action = "<cmd>DiffviewOpen<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>gf";
        action = "<cmd>lua require('neogit').action('fetch', 'fetch_upstream', { '--prune' })()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>gh";
        action = "<cmd>lua require('telescope.builtin').git_bcommits()<cr>";
      }
      {
        mode = "v"; 
        key = "<leader>gh";
        action = "<cmd>lua require('telescope.builtin').git_bcommits_range()<cr>";
      }
      {
        mode = "n";
        key = "<leader>gl"; 
        action = "<cmd>lua require('neogit').action('log', 'log_current', { '--decorate' })()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>gp";
        action = "<cmd>lua require('neogit').action('pull', 'from_pushremote', { '--rebase' })(); ${redrawStatusLine}<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>gP";
        action = "<cmd>lua require('neogit').action('push', 'to_pushremote', { '--force-with-lease' })()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>gr";
        action = "<cmd>AdvancedGitSearch checkout_reflog<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>gm";
        action = "<cmd>lua require('neogit').action('branch', 'open_pull_request')()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>hp";
        action = "<cmd>Gitsigns preview_hunk_inline<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>hx";
        action = "<cmd>Gitsigns reset_hunk<cr>";
      }
      {
        mode = "n";
        key = "<leader>i"; 
        action = "<cmd>lua lsp_import()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>l";
        action = "<cmd>e!<cr>";
      }
      {
        mode = "n";
        key = "<leader>ma";
        action = "<cmd>lua require('harpoon'):list():add()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>mt";
        action = "<cmd>Markview splitToggle<cr>";
      }
      {
        mode = "n";
        key = "<leader>n";
        action = "<cmd>Gitsigns nav_hunk next<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>p";
        action = "<cmd>Gitsigns nav_hunk prev<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>q";
        action = "<cmd>normal! qq<cr>";
      }
      {
        mode = "v"; 
        key = "<leader>q";
        action = "<esc><cmd>'<,'> normal! @q<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>ra";
        action = "<cmd>lua require('neogit').action('rebase', 'abort')()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>rb";
        action = "<cmd>lua require('neogit').action('rebase', 'onto_elsewhere')()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>rc";
        action = "<cmd>lua continue_rebase()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>ri";
        action = "<cmd>lua require('neogit').action('rebase', 'interactively')()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>sp";
        action = "<cmd>lua require('neogit').action('stash', 'pop')()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>ss";
        action = "<cmd>lua require('neogit').action('stash', 'both', { '--include-untracked' })()<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>tc";
        action = "<cmd>tabnew<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>tn";
        action = "<cmd>tabnext<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>tN";
        action = "<cmd>+tabmove<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>to";
        action = "<cmd>tabonly<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>tp";
        action = "<cmd>tabprevious<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>tP";
        action = "<cmd>-tabmove<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>w";
        action = "<cmd>w<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>W";
        action = "<cmd>wa<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>xh";
        action = "<cmd>lua cmd(\"git add --all; git reset --hard\")<cr>";
      }
      {
        mode = "n"; 
        key = "<leader>xs";
        action = "<cmd>lua cmd(\"git reset HEAD~1\")<cr>";
      }
    ];
  };
}
