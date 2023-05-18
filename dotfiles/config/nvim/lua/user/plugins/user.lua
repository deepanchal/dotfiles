return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

  -- {
  --   "jose-elias-alvarez/typescript.nvim",
  --   after = "mason-lspconfig.nvim",
  --   config = function()
  --     require("typescript").setup {
  --       server = astronvim.lsp.server_settings "tsserver",
  --     }
  --   end,
  -- },

  { "junegunn/vim-easy-align" },
  { "tpope/vim-surround" },
  { "christoomey/vim-tmux-navigator" },
  {
    "sainnhe/sonokai",
    init = function() -- init function runs before the plugin is loaded
      vim.g.sonokai_style = "shusia"
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function() require("catppuccin").setup {} end,
  },
  {
    "projekt0n/github-nvim-theme",
    version = "v0.0.7",
    -- branch = "0.0.x",
    config = function()
      require("github-theme").setup {
        -- ...
      }
    end,
  },
  {
    "IndianBoy42/tree-sitter-just", -- for casey/just
    event = "BufEnter *justfile,*Justfile",
    config = function() require("tree-sitter-just").setup {} end,
  },
  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
    },
  },
}
