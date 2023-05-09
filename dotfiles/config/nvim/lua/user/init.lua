return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "astrodark",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    local unmap = vim.api.nvim_del_keymap
    local map = vim.keymap.set

    -- Set key bindings
    vim.keymap.set("n", "<C-s>", ":w!<CR>")

    -----------------------------------------------------
    -- Keymap overrides
    -----------------------------------------------------
    unmap("n", "<leader>ff") -- unmap find files
    unmap("n", "<leader>fw") -- unmap find words

    -- map <leader>ff to search in hidden files excluding .git dir
    map(
      "n",
      "<leader>ff",
      function()
        require("telescope.builtin").find_files {
          find_command = {
            "rg",
            "--hidden",
            "--files",
            "--iglob",
            "!.git",
            "--iglob",
            "!node_modules",
            "--no-ignore-vcs",
          },
        }
      end,
      { desc = "Search all files" }
    )

    -- map <leader>fw to search for words in hidden files excluding .git dir
    map(
      "n",
      "<leader>fw",
      function()
        require("telescope.builtin").live_grep {
          vimgrep_arguments = {
            "rg",
            "--hidden",
            "--column",
            "--iglob",
            "!.git",
            "--iglob",
            "!node_modules",
            "--no-ignore-vcs",
          },
        }
      end,
      { desc = "Search all words" }
    )
    -- Set up custom filetypes
    vim.filetype.add {
      extension = {
        j2 = "htmldjango",
        -- foo = "fooscript",
      },
      -- filename = {
      --   ["Foofile"] = "fooscript",
      -- },
      pattern = {
        -- ["~/%.config/foo/.*"] = "fooscript",
        [".envrc*"] = "sh",
        [".zsh*"] = "sh",
      },
    }
  end,
}
