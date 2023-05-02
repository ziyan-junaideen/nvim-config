require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ruby_ls", 'solargraph', 'tsserver', 'erlangls' },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- require('core.plugin_config.lsp_keybindings')

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

-- require('lspsaga').setup({
--   code_action_icon = "💡",
--   symbol_in_winbar = {
--     in_custom = false,
--     enable = true,
--     separator = ' ',
--     show_file = true,
--     file_formatter = ""
--   },
-- })

local lspconfig = require("lspconfig")
  
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.tsserver.setup{}
lspconfig.erlangls.setup{}

-- lspconfig.solargraph.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

lspconfig.ruby_ls.setup { 
  capabilities = capabilities,

  on_attach = function(client, buffer)
    print('On Attach Solargraph')

    local callback = function()
      local params = vim.lsp.util.make_text_document_params(buffer)

      client.request(
        'textDocument/diagnostic',
        { textDocument = params },
        function(err, result)
          if err then return end

          vim.lsp.diagnostic.on_publish_diagnostics(
            nil,
            vim.tbl_extend('keep', params, { diagnostics = result.items }),
            { client_id = client.id }
          )
        end
      )
    end

    callback() -- call on attach

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePre', 'BufReadPost', 'InsertLeave', 'TextChanged' }, {
      buffer = buffer,
      callback = callback,
    })

    -- The default on attach
    on_attach()
  end,
}
