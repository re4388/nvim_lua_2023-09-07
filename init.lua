-- 先啟動
-- 這邊我用 plugged 提供的 plugin 來讓 vscode 使用
vim.cmd [[
call plug#begin(stdpath('config') . '/plugged')
]]

-- cmd = vim.cmd; -- Command function
-- api = vim.api; -- Neovim API
-- lsp = vim.lsp; -- LSP API
-- fn = vim.fn;   -- Vim function
-- g = vim.g;     -- Vim globals
-- opt = vim.opt; -- Vim optionals





-- 這邊都是 vscode 的設定
if vim.g.vscode then
  -- 可以這樣設計，還沒設定
  -- vim.cmd[[source $HOME/.config/nvim/vscode/settings.vim]]

  vim.opt.clipboard = 'unnamedplus'

  vim.cmd [[

  nnoremap qq yiw



  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup END
]]
else -- else 底下的都是專屬於 terminal neovim 的設定
  -- Bootsraping plugin manager
  require "lazy-bootstrap"

  -- Settings
  require "settings"
  require "keybindings"

  -- Plugin management {{{
  local lazy = require("lazy")
  lazy.setup("plugins")
  -- }}}




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

  -- lua 版本的 highlight yank
  -- highlight yanked text for 200ms using the "Visual" highlight group
  vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END
  ]]
end





-- 以下都是要讓 vscode 和 nvim 可以"共享" 的設定


vim.cmd [[
call plug#begin()


Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-commentary'

call plug#end()
]]
