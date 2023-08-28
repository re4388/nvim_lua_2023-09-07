--[[
  File: init.lua
  Description: Entry point file for neovim
]]

-- Bootsraping plugin manager
require "lazy-bootstrap"

-- Settings
require "settings"
require "keybindings"

-- Plugin management {{{
local lazy = require("lazy")
lazy.setup("plugins")
-- }}}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0

-- 
--[[
  my personal setup
]]


-- highlight yanked text for 200ms using the "Visual" highlight group
cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]


-- persistent undo, Maintain undo history between sessions
opt.undofile = true
opt.number = true
opt.foldenable = false



-- Return to last edit position when opening files (You want this!)
local api = vim.api
api.nvim_create_autocmd({ 'BufRead', 'BufReadPost' }, {
  callback = function()
    local row, column = unpack(api.nvim_buf_get_mark(0, '"'))
    local buf_line_count = api.nvim_buf_line_count(0)

    if row >= 1 and row <= buf_line_count then
      api.nvim_win_set_cursor(0, { row, column })
    end
  end,
})