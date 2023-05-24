require('neotest').setup({
  adapters = {
    require('neotest-rspec'),
  },
})

local run = require('neotest').run

vim.keymap.set('n', 'rf', run.run(vim.fn.expand('%'))
