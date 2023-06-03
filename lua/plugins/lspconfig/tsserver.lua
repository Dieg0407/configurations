local lsp_server = {}

function lsp_server.configure(capabilities)
  require("lspconfig").tsserver.setup {
    capabilities = capabilities,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
  }
end

return lsp_server
