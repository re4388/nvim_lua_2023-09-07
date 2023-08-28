--[[
  File: telescope.lua
  Description: Telescope plugin configuration
  See: https://github.com/nvim-telescope/telescope.nvim
]]
local telescope = require("telescope")
telescope.setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.1 }
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  -- other configuration values here
})



