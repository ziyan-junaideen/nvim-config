local noremap = { noremap = true }

-- What is the diffence between vim.keymap.set and vim.api.nvim_set_keymap?

vim.keymap.set('n', '<leader>gs', '<CMD>G<CR>', noremap)
vim.keymap.set('n', '<leader>gq', '<CMD>G<CR><CMD>q<CR>', noremap)
vim.keymap.set('n', '<leader>gw', '<CMD>Gwrite<CR>', noremap)
vim.keymap.set('n', '<leader>gr', '<CMD>Gread<CR>', noremap)
vim.keymap.set('n', '<leader>gh', '<CMD>diffget //2<CR>', noremap)
vim.keymap.set('n', '<leader>gl', '<CMD>diffget //3<CR>', noremap)
vim.keymap.set('n', '<leader>gp', '<CMD>Git push<CR>', noremap)

--[[
vim.api.nvim_set_keymap('n', '<leader>gs', '<CMD>G<CR>', noremap)
vim.api.nvim_set_keymap('n', '<leader>gq', '<CMD>G<CR><CMD>q<CR>', noremap)
vim.api.nvim_set_keymap('n', '<leader>gw', '<CMD>Gwrite<CR>', noremap)
vim.api.nvim_set_keymap('n', '<leader>gr', '<CMD>Gread<CR>', noremap)
vim.api.nvim_set_keymap('n', '<leader>gh', '<CMD>diffget //2<CR>', noremap)
vim.api.nvim_set_keymap('n', '<leader>gl', '<CMD>diffget //3<CR>', noremap)
vim.api.nvim_set_keymap('n', '<leader>gp', '<CMD>Git push<CR>', noremap)
]]--
