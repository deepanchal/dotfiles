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

  { "junegunn/vim-easy-align" },
  { "tpope/vim-surround" },
  { "christoomey/vim-tmux-navigator" },
  -- {
  --   "jose-elias-alvarez/typescript.nvim",
  --   after = "mason-lspconfig.nvim",
  --   config = function()
  --     require("typescript").setup {
  --       server = astronvim.lsp.server_settings "tsserver",
  --     }
  --   end,
  -- },
}
