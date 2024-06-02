require "helpers/globals"
require "helpers/keyboard"

-- vim keyboard cheatsheet: https://vim.rtorr.com/
g.mapleader = ' ' -- Use Space, like key for alternative hotkeys


-- go back and go forward (jumpList)
vim.api.nvim_set_keymap('n', '<C-q>', '<C-o>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-a>', '<C-i>', { noremap = true })

-- let's make life easier
vim.api.nvim_set_keymap('n', 'qq', 'yiw', { noremap = true })
-- r as replace
vim.api.nvim_set_keymap('n', 'qr', 'griw', { noremap = false })

-- qs to copy string quicker
vim.api.nvim_set_keymap('n', 'qs', 'yiq', { noremap = false })


-- quick move
vim.api.nvim_set_keymap('n', 'qj', '20gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'qk', '20gk', { noremap = true })
vim.api.nvim_set_keymap('v', 'qj', '20gj', { noremap = true })
vim.api.nvim_set_keymap('v', 'qk', '20gk', { noremap = true })

-- surround vim or other
vim.api.nvim_set_keymap('n', "s'", "ysiw'", { noremap = true })
vim.api.nvim_set_keymap('n', 's"', 'ysiw"', { noremap = true })
vim.api.nvim_set_keymap('n', 's`', 'ysiw`', { noremap = true })
vim.api.nvim_set_keymap('n', 'sb', 'ysiwb', { noremap = true })
vim.api.nvim_set_keymap('n', 'sB', 'ysiwB', { noremap = true })
vim.api.nvim_set_keymap('n', 'st', 'ysiw<', { noremap = true })
vim.api.nvim_set_keymap('n', 's[', 'ysiw[', { noremap = true })
vim.api.nvim_set_keymap('n', 's*', 'ysiw', { noremap = true })


-- window switch between editor/buffer
vim.api.nvim_set_keymap('n', '<S-h>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-j>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-k>', '<C-W>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-l>', '<C-W>l', { noremap = true })


-----------------------------------------------------------
-----------------------------------------------------------
---  below shall be the keymap that is not the same as VSCODE
-----------------------------------------------------------
-----------------------------------------------------------

vim.api.nvim_exec(
  [[
     " 下面多一行 console.log("xxx)
     " xxx 是目前 curosor 上的 word
     nnoremap <silent> <buffer> <leader>c :silent put=['console.log(\"<C-r><C-w>\", <C-r><C-w>);']<CR>-2==+


     """""""""""""""""""""""""""""""""""
     " terminal mode friendly default
     """""""""""""""""""""""""""""""""""
     " use same way to switch between terminal
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l

    " use esc to switch to terminal normal mode
    tnoremap <Esc> <C-\><C-n>
    " use c-v and esc if we want esc in termninal mode
    tnoremap <C-v><Esc> <Esc>

    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
     tnoremap <Esc> <C-\><C-n>
]], true)



-- TODO: 還沒搞定
-- api.nvim_set_keymap('n', '<leader>j', '*', { noremap = true })



-- H and L to go to line being and end
-- 拿掉, try to learn the native key!!
-- nm('H', '^')
-- nm('L', '$')



-- Duplicate lines and put down
-- make it even easier than yyps
-- nm('<leader>d', 'm`YP``')
-- vm('<leader>d', 'YPgv')







-- api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true })
-- api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true })
-- api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true })
-- api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true })

nm('<C-Left>', '<cmd>vertical resize +2<CR>')
nm('<C-Right>', '<cmd>vertical resize -2<CR>')
nm('<C-Up>', '<cmd>resize -2<CR>')
nm('<C-Down>', '<cmd>resize +2<CR>')
-- " nnoremap <C-Left> :vertical resize +2<cr>
-- " nnoremap <C-Right> :vertical resize -2<cr>
-- " nnoremap <C-Up> :resize -2<cr>
-- " nnoremap <C-Down> :resize +2<cr>


-- nnoremap <leader>n :noh<cr>

-- 跳出一個 LIST 相關
-- nm('<leader>j', '<cmd>Telescope jumplist<CR>') -- Show jumplist (previous locations)
nm('<C-2>', '<cmd>Telescope marks<CR>')       -- Show marks (previous locations)
nm('<C-e>', '<cmd>Telescope git_files<CR>')   -- Search for a file in project
nm('<C-s>', '<cmd>Telescope live_grep<CR>')   -- Find a string in project
-- nm('<C-n>', '<cmd>Telescope lsp_document_symbols<CR>')
nm('<leader>b', '<cmd>Telescope buffers<CR>') -- Show all buffers
-- nm('<leader>z', '<cmd>Telescope<CR>')         -- Show all commands
-- nm('<leader>p', '<cmd>Telescope oldfiles<CR>')                                   -- Show recent files
-- nm('<leader>o', '<cmd>Telescope find_files<CR>')                                 -- Search for a file (ignoring git-ignore)
-- nm('<leader>b', '<cmd>Telescope git_branches<CR>')                               -- Show git branches
-- nm('<leader>t', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')              -- Search for dynamic symbols



-- LSP 相關
-- Telescope {{{
nm('<C-d>', '<cmd>Telescope lsp_definitions<CR>') -- Goto definition
-- nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>' )                                      -- Hover object
-- nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')                                -- Code actions
nm('<C-p>', '<cmd>lua vim.lsp.buf.rename()<CR>') -- Rename an object
-- nm('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')                                -- Go to declaration
-- nm('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')                                -- Go to declaration
-- }}}

-- Trouble {{{
-- nm('<leader>x', '<cmd>TroubleToggle<CR>')                                         -- Show all problems in project (with help of LSP)
-- nm('gr', '<cmd>Trouble lsp_references<CR>')                                       -- Show use of object in project
-- }}}

-- Neo Tree {{{
nm('<C-1>', '<cmd>NeoTreeFocusToggle<CR>') -- Toggle file explorer
-- }}}



-- " move current line up and down

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0

-- nm('<leader>c', 'yiwoconsole.log("<Esc>p<Esc>")')

--
-- vim.api.nvim_exec(
-- [[
--     nnoremap <silent> <buffer> ,cl :silent put=['// tslint:disable-next-line', 'console.log(\"<C-r><C-w>\", <C-r><C-w>);']<CR>-2==+
-- ]],
-- true)
