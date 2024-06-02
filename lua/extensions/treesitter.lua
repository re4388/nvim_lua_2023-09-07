--[[
  File: treesitter.lua
  Description: Configuration of tree-sitter
  See: https://github.com/tree-sitter/tree-sitter
]]
require 'nvim-treesitter.configs'.setup {

  -- Needed parsers
  ensure_installed = {
    "lua",
    "typescript",
    "javascript",
    "go",
    "python",
  },

  -- Install all parsers synchronously
  sync_install = false,

}
