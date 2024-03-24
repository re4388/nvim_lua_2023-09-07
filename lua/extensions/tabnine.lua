-- require('tabnine').setup({
--    disable_auto_comment = true,
--    accept_keymap = "<C-space>",
--    dismiss_keymap = "<C-]>",
--    debounce_ms = 800,
--    suggestion_color = { gui = "#808080", cterm = 244 },
--    exclude_filetypes = { "TelescopePrompt", "NvimTree" },
--    log_file_path = nil, -- absolute path to Tabnine log file
-- })


local tabnine = require('cmp_tabnine.config')

tabnine:setup({
   max_lines = 1000,
   max_num_results = 20,
   sort = true,
   run_on_every_keystroke = true,
   snippet_placeholder = '..',
   ignored_file_types = {
      -- default is not to ignore
      -- uncomment to ignore in lua:
      -- lua = true
   },
   show_prediction_strength = false,
   min_percent = 0
})


-- require('tabnine.status').status()

-- Commands
-- :TabnineStatus - to print Tabnine status
-- :TabnineDisable - to disable Tabnine
-- :TabnineEnable - to enable Tabnine
-- :TabnineToggle - to toggle enable/disable
-- :TabnineChat - to launch Tabnine chat
-- :TabnineLoginWithAuthToken - to log in using auth token (for headless environments, where no browser is available)


-- Tabnine Chat commands
-- :TabnineChat - to open Tabnine Chat
-- :TabnineFix - to fix the function in scope
-- :TabnineTest - to generate tests for function in scope
-- :TabnineExplain - to explain the function in scope
