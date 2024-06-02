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

-- 這邊都是 vscode 的熱鍵設定, 和 terminal 版本沒有共享熱鍵喔
if vim.g.vscode then
  print("init.lua begin init in vscode..")
  -- 可以這樣設計，還沒設定
  -- vim.cmd[[source $HOME/.config/nvim/vscode/settings.vim]]

  -- 這個值表示 Vim 將使用系統的主要剪貼簿
  vim.opt.clipboard = 'unnamedplus'

  -- 如果你要 map 過去另外一邊有 plug 的熱鍵，像是 "gr"iw 中的 gr
  -- 那你需要使用 nmap (會 resursive 到 plug in 熱鍵), 無法用 nnoremap (non-resursive)

  vim.cmd [[

  nnoremap qq yiw
  nmap qj griw
  nmap qs yiq


  " nnoremap H ^
  " nnoremap L $

  " remove highlight when hit enter
  nnoremap <silent> <cr> :noh<cr><cr>

  " move current line up and down faster
  nnoremap qj 20gj
  nnoremap qk 20gk
  vnoremap qj 20gj
  vnoremap qk 20gk


  " eaiser surrounding vim, 因為 "增加"操作比較複雜，一律用 s replace ysiw
  nmap s` ysiw`
  nmap s" ysiw"
  nmap s' ysiw'
  nmap sb ysiwb
  nmap sB ysiwB
  nmap s< ysiw<
  nmap s{ ysiw{
  nmap s( ysiw(
  nmap s[ ysiw[
  nmap s* ysiw*


  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup END
]]
  print("init.lua finish loaded in vscode")
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


-- 以下都是要讓 vscode 和 nvim 可以 "共享" 的設定


-- text object 系列
-- kana/vim-textobj-user: 下面的 text object plug-in based on this
-- kana/vim-textobj-entire: entire buffer as text object
-- beloglazov/vim-textobj-quotes -> use q as "", '', `` 的 text obejct
-- kana/vim-textobj-function -> not use, only for Java, C and vim lang
-- Julian/vim-textobj-brace -> 自動找到最近的 (), [], {}
-- vim-scripts/ReplaceWithRegister -> gr as prefix to replace text object
-- tpope/vim-repeat -> 讓你的一些 vim text object 的操作也可以套用在 dot operation 上, 也可以自己增加支援
vim.cmd [[
call plug#begin()

Plug 'kana/vim-textobj-user'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'kana/vim-textobj-entire'
Plug 'Julian/vim-textobj-brace'


Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

call plug#end()
]]



-- hello world
