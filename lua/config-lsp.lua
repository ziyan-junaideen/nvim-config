-- Plugins to look in to
-- 1. Fidget
-- 2. Neodev

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ruby_ls" }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end
  
require("lspconfig").lua_ls.setup {
  on_attach = on_attach
}

require("lspconfig").ruby_ls.setup {
  on_attach = on_attach
}

-- Turn on lsp status information
-- require('fidget').setup()

