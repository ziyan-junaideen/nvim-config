return {
  {
    'tpope/vim-fugitive',
    config = function()
      local noremap = { noremap = true }

      vim.keymap.set('n', '<leader>gs', '<CMD>G<CR>', noremap)
      vim.keymap.set('n', '<leader>gq', '<CMD>G<CR><CMD>q<CR>', noremap)
      vim.keymap.set('n', '<leader>gw', '<CMD>Gwrite<CR>', noremap)
      vim.keymap.set('n', '<leader>gr', '<CMD>Gread<CR>', noremap)
      vim.keymap.set('n', '<leader>gh', '<CMD>diffget //2<CR>', noremap)
      vim.keymap.set('n', '<leader>gl', '<CMD>diffget //3<CR>', noremap)
      vim.keymap.set('n', '<leader>gp', '<CMD>Git push<CR>', noremap)
    end
  },
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        }
      }

      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'onedark',
          component_separators = '|',
          section_separators = '',
        },
      }
    end
  }
}
