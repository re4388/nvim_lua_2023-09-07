require "helpers/globals"

return {

  -- -- {
  -- --   'codota/tabnine-nvim',
  -- --   build = "./dl_binaries.sh"
  -- -- },
  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = { useDefaultKeymaps = true },
  },

  -- {
  --   'tzachar/cmp-tabnine',
  --   build = './install.sh',
  --   dependencies = 'hrsh7th/nvim-cmp',
  -- },


  -- { "kana/vim-textobj-user" },
  -- { "beloglazov/vim-textobj-quotes" },
  -- { "kana/vim-textobj-entire" },
  -- { "Julian/vim-textobj-brace" },
  -- { "tpope/vim-surround" },
  -- { "vim-scripts/ReplaceWithRegister" },
  -- { "tpope/vim-commentary" },
  -- { "tpope/vim-repeat" },


  -- vim - scripts / ReplaceWithRegister
  {
    "vim-scripts/ReplaceWithRegister",
    config = function()
    end
  },


  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  -- {
  --   'theprimeagen/harpoon',
  --   lazy = false,
  --   config = function()
  --     require "extensions.harpoon"
  --   end
  -- },

  -- Lualine
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons"
  --   },
  -- },


  -- -- https://github.com/numToStr/Comment.nvim
  -- {
  --   'numToStr/Comment.nvim',
  --   opts = {
  --     -- add any options here
  --   },
  --   lazy = false,
  -- },


  -- Mason
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require "extensions.mason"
    end
  },





  -- Neo Tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "extensions.neotree"
    end
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      require "extensions.telescope"
    end
  },

  -- CMP
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require "extensions.cmp"
    end
  },
  -- Bufferline
  -- {
  --   "akinsho/bufferline.nvim",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons"
  --   },
  -- },

  -- LSP Kind
  {
    'onsails/lspkind-nvim',
    lazy = true,
    config = function()
      require "extensions.lspkind"
    end
  },

  -- Git Signs
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require "extensions.gitsigns"
    end
  },

  -- Trouble
  {
    "folke/trouble.nvim",
    lazy = true,
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require "extensions.trouble"
    end,
  },


  -- TreeSitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "extensions.treesitter"
    end
  },

  -- Theme:
  -- {
  --   "sainnhe/sonokai",
  --   lazy = false,
  --   config = function ()
  --     require "extensions.colorscheme.sonokai"
  --   end
  -- },

  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --     require "extensions.colorscheme.gruvbox"
  --   end
  -- }

}
