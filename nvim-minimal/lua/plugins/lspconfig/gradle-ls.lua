local lsp_server = {}

function lsp_server.configure(capabilities)
  require("lspconfig").gradle_ls.setup {
    capabilities = capabilities
  }
end

return lsp_server
