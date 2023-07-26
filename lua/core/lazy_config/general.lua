return {
  'folke/neodev.nvim',
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("nvim-tree").setup()
    end,
  },
  {
    'petertriho/cmp-git',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require("cmp_git").setup()
    end
  }
}
