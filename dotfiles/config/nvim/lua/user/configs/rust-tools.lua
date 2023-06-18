local lsp_utils = require('astronvim.utils.lsp')

local options = {
  server = {
    on_attach = lsp_utils.on_attach,
    capabilities = lsp_utils.capabilities,
  }
}

return options
