require "helpers/globals"
require "helpers/keyboard"

g.mapleader = ' '                                                                 -- Use Space, like key for alternative hotkeys

-- vim keyboard cheatsheet: https://vim.rtorr.com/










-- key I remap
-- Telescope {{{
nm('<C-d>', '<cmd>Telescope lsp_definitions<CR>')                            -- Goto declaration

-- go back and go forward (jumpList)
api.nvim_set_keymap('n', '<C-q>', '<C-O>', { noremap = true }) -- go back
api.nvim_set_keymap('n', '<C-a>', '<C-I>', { noremap = true }) -- go forward


-- quick move
api.nvim_set_keymap('n', '<S-j>', '20gj', { noremap = true })
api.nvim_set_keymap('n', '<S-k>', '20gk', { noremap = true })
-- api.nvim_set_keymap('v', 'qj', '20gj', { noremap = true })
-- api.nvim_set_keymap('v', 'qk', '20gk', { noremap = true })






-- let's make life easier
-- nnoremap qq -> yiw 
api.nvim_set_keymap('n', 'qq', 'yiw', { noremap = true })
api.nvim_set_keymap('n', '<leader>j', '*', { noremap = true })

-- H and L to go to line being and end
api.nvim_set_keymap('n', 'H', '^', { noremap = true })
api.nvim_set_keymap('n', 'L', '$', { noremap = true })

-- Duplicate lines and put down
-- make it even easier than yyp
api.nvim_set_keymap('n', '<leader>d', 'm`YP``', { noremap = true })
api.nvim_set_keymap('v', '<leader>d', 'YPgv', { noremap = true })
-- nnoremap <Leader>d m`YP``
-- vnoremap <Leader>d 




api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true })
api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true })
api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true })
api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true })



-- LSP {{{
-- nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>' )                                      -- Hover object
-- nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')                                -- Code actions
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')                                     -- Rename an object
-- nm('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')                                -- Go to declaration
-- nm('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')                                -- Go to declaration
 -- }}}


nm('<leader>j', '<cmd>Telescope jumplist<CR>')                               -- Show jumplist (previous locations)
nm('<leader>m', '<cmd>Telescope marks<CR>')                               -- Show jumplist (previous locations)
nm('<C-e>', '<cmd>Telescope git_files<CR>')                                  -- Search for a file in project
nm('<C-s>', '<cmd>Telescope live_grep<CR>')                                  -- Find a string in project
nm('<C-n>', '<cmd>Telescope lsp_document_symbols<CR>')                                 


nm('<leader>b', '<cmd>Telescope buffers<CR>')                                    -- Show all buffers
nm('<leader>a', '<cmd>Telescope<CR>')                                            -- Show all commands


-- nm('<leader>p', '<cmd>Telescope oldfiles<CR>')                                   -- Show recent files
-- nm('<leader>o', '<cmd>Telescope find_files<CR>')                                 -- Search for a file (ignoring git-ignore)
-- nm('<leader>b', '<cmd>Telescope git_branches<CR>')                               -- Show git branches
-- nm('<leader>t', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')              -- Search for dynamic symbols
-- }}}

-- Trouble {{{
-- nm('<leader>x', '<cmd>TroubleToggle<CR>')                                         -- Show all problems in project (with help of LSP)
-- nm('gr', '<cmd>Trouble lsp_references<CR>')                                       -- Show use of object in project
-- }}}

-- Neo Tree {{{
nm('<C-1>', '<cmd>NeoTreeFocusToggle<CR>')                                        -- Toggle file explorer
-- }}}






-- todo: 看要用surround vim or other 
-- api.nvim_set_keymap('n', 'q`', 'ysiw`', { noremap = true })
-- api.nvim_set_keymap('n', 'q"', 'ysiw"', { noremap = true })
-- api.nvim_set_keymap('n', "q'", "ysiw'", { noremap = true })
-- api.nvim_set_keymap('n', 'qb', 'ysiwb', { noremap = true })
-- api.nvim_set_keymap('n', 'qB', 'ysiwB', { noremap = true })
-- api.nvim_set_keymap('n', 'qt', 'ysiw<', { noremap = true })
-- api.nvim_set_keymap('n', 'q[', 'ysiw[', { noremap = true })

-- " move current line up and down
-- " eaiser surrounding vim
-- " don't forget you can use S in visual mode...
-- nmap q` ysiw`
-- nmap q" ysiw"
-- nmap q' ysiw'
-- nmap qb ysiwb 
-- nmap qB ysiwB
-- nmap qt ysiw<
-- nmap q[ ysiw[




-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0


