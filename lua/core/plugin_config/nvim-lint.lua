require('lint').linters_by_ft = {
  markdown = {'vale',},
  ruby = {'rubocop',},
  javascript = {'eslint',},
  lua = {'luacheck',},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
