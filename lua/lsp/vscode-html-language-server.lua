local htmlCapabilities = vim.lsp.protocol.make_client_capabilities()
htmlCapabilities.textDocument.completion.completionItem.snippetSupport = true

require"lspconfig".html.setup {
  capabilities = htmlCapabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    },
    provideFormatter = true
  },
  root_dir = function(startpath)
      return M.search_ancestors(startpath, matcher)
  end,
  settings = {},
  single_file_support = true,
}
