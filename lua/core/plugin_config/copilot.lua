-- Removing mappings
--[[
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
--]]

--[[
-- Resources: 
-- https://www.reddit.com/r/neovim/comments/sk70rk/using_github_copilot_in_neovim_tab_map_has_been/ (tab disabled fix)
-- https://github.com/orgs/community/discussions/11611 (copilot next previous mapping change)
--
--]]

--[[
require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})
--]]

require('copilot').setup({
  suggestion = {enabled = false},
  panel = {enabled = false},
})
require('copilot_cmp').setup()

