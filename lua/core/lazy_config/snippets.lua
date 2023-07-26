return {
  {
    'L3MON4D3/LuaSnip',     -- Required
    version = "2.*",
    build = "make install_jsregexp",
    dependencies = {
      {'rafamadriz/friendly-snippets'},
    },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()

      local luasnip = require('luasnip')
      luasnip.filetype_extend("ruby", {"rails"})
    end,
  },
}
