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

  ------------------------------------------------
  -- Helper plugins
  ------------------------------------------------
  { "junegunn/vim-easy-align" },
  { "tpope/vim-surround" },
  { "christoomey/vim-tmux-navigator" },
  ------------------------------------------------
  -- Themes
  ------------------------------------------------
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
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup {
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,    -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      }
    end,
  },
  { "sainnhe/gruvbox-material" },
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
  ------------------------------------------------
  -- Rust Configuration
  ------------------------------------------------
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function() vim.g.rustfmt_autosave = 1 end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function() return require "user.configs.rust-tools" end,
    config = function(_, opts) require("rust-tools").setup(opts) end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    requires = { { "nvim-lua/plenary.nvim" } },
    dependencies = "hrsh7th/nvim-cmp",
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
  ------------------------------------------------
  -- Auto completion configuration
  ------------------------------------------------
  {
    {
      -- override nvim-cmp plugin
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-emoji", -- add cmp source as dependency of cmp
      },
      -- override the options table that is used in the `require("cmp").setup()` call
      opts = function(_, opts)
        -- opts parameter is the default options table
        -- the function is lazy loaded so cmp is able to be required
        local cmp = require "cmp"
        -- modify the sources part of the options table
        opts.sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750 },
          { name = "buffer",   priority = 500 },
          { name = "path",     priority = 250 },
          { name = "emoji",    priority = 700 }, -- for emoji auto completion in nvim. Trigger by typing `:`
          { name = "crates" },                -- for rust crates auto completion in Cargo.toml
        }
        -- return the new table to be used
        return opts
      end,
    },
  },
  ------------------------------------------------
  -- Other lang support
  ------------------------------------------------
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
