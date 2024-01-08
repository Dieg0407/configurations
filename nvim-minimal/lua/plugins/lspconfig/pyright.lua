local lsp_server = {}

function lsp_server.configure(capabilities)
  require("lspconfig").pyright.setup {
    capabilities = capabilities
  }
end

return lsp_server
