local lsp_server = {}

function lsp_server.configure(capabilities)
  require("lspconfig").rust_analyzer.setup {
    capabilities = capabilities,
    cmd = { "rust-analyzer", "-v" }
  }
end

return lsp_server
