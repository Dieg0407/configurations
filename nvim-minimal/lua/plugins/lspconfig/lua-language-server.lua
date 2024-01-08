local lsp_server = {}

function lsp_server.configure(capabilities)
  require("lspconfig").lua_ls.setup {
    capabilities = capabilities
  }
end

return lsp_server
