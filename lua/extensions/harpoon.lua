local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)



-- -- Alias for function, that set new keybindings
-- local map = vim.api.nvim_set_keymap

-- -- Normal mode keybinding setter
-- function nm(key, command)
-- 	map('n', key, command, {noremap = true})
-- end