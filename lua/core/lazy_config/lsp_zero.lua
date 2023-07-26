return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.api.nvim_command, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      -- Do we need cmp_luasnip

      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
    config = function()
      require("mason.settings").set({
        ui = { border = "rounded" }
      })
      require("mason").setup()

      local mason_lspconfig = require("mason-lspconfig")
      local servers = {
        solargraph = {},
        lua_ls = {
          Lua = {
            diagnostics = { globals = {"vim"} },
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
          },
        },
      }
      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      mason_lspconfig.setup_handlers({
        function(server_name)
          local normal_capabilities = vim.lsp.protocol.make_client_capabilities()
          local capabilities = cmp_nvim_lsp.default_capabilities(normal_capabilities)

          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            settings = servers[server_name]
          }
        end,
      })

      local lsp = require('lsp-zero')

      lsp.preset({})

      lsp.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp.default_keymaps({buffer = bufnr})
      end)

      -- (Optional) Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup_nvim_cmp({
        sources = {
          { name = "path" },
          { name = "nvim_lsp", keyword_length = 1 }, -- Was 3
          { name = "luasnip", keyword_length = 1 }, -- was 3
          {
            name = "buffer",
            sorting = {
              -- distance-based sorting
              comparators = {
                function(...)
                  local cmp_buffer = require("cmp_buffer")
                  return cmp_buffer:compare_locality(...)
                end,
              }
            },
            option = {
              -- get completion suggestions from all buffers, not just current one
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            }
          }
        }
      })

      lsp.setup()
    end
  }
}
