local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- theme
  -- use({
  --   "olivercederborg/poimandres.nvim",
  --   config = function()
  --     require("poimandres").setup({
  --       -- leave this setup function empty for default config
  --       -- or refer to the configuration section
  --       -- for configuration options
  --     })
  --   end,
  -- })

  -- UI
  use("nvim-tree/nvim-tree.lua")
  use("nvim-tree/nvim-web-devicons")
  use("christoomey/vim-tmux-navigator")
  use("szw/vim-maximizer")

  -- finder
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  })

  -- LSP
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "jose-elias-alvarez/typescript.nvim" },
      { "onsails/lspkind.nvim" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      { "rafamadriz/friendly-snippets" },
    },
  })

  use({
    "glepnir/lspsaga.nvim",
    opt = true,
    branch = "main",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  })

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim")     -- bridges gap b/w mason & null-ls
  use("lukas-reineke/indent-blankline.nvim")

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  -- auto closing
  use("windwp/nvim-autopairs")                                 -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- to be discovered
  use("tpope/vim-surround")              -- check docs (add/rm quotes)
  -- use("vim-scripts/ReplaceWithRegister") -- check docs
  use({ "numToStr/Comment.nvim" })

  -- use({ "github/copilot.vim" })
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        sugggetion = {
          enabled = true,
        }
      })
    end
  }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }

  use {
    "ray-x/lsp_signature.nvim",
  }

  -- use { "petertriho/nvim-scrollbar",
  --   config = function()
  --     require("scrollbar").setup()
  --   end }

  use({
    "ziontee113/color-picker.nvim",
    config = function()
      require("color-picker")
    end,
  })


  -- use {
  --   'andersevenrud/nordic.nvim',
  --   config = function()
  --     -- The table used in this example contains the default settings.
  --     -- Modify or remove these to your liking (this also applies to alternatives below):
  --     require('nordic').colorscheme({
  --       -- Underline style used for spelling
  --       -- Options: 'none', 'underline', 'undercurl'
  --       underline_option = 'none',
  --
  --       -- Italics for certain keywords such as constructors, functions,
  --       -- labels and namespaces
  --       italic = true,
  --
  --       -- Italic styled comments
  --       italic_comments = false,
  --
  --       -- Minimal mode: different choice of colors for Tabs and StatusLine
  --       minimal_mode = false,
  --
  --       -- Darker backgrounds for certain sidebars, popups, etc.
  --       -- Options: true, false, or a table of explicit names
  --       -- Supported: terminal, qf, vista_kind, packer, nvim-tree, telescope, whichkey
  --       alternate_backgrounds = true,
  --
  --       -- Callback function to define custom color groups
  --       -- See 'lua/nordic/colors/example.lua' for example defitions
  --       custom_colors = function(c, s, cs)
  --         return {}
  --       end
  --     })
  --   end
  -- }

  -- use {
  --   "kyazdani42/blue-moon",
  --   config = function()
  --     vim.opt.termguicolors = true
  --     vim.cmd "colorscheme blue-moon"
  --   end
  -- }
  --
  -- Using Packer:
  use {'Mofiqul/dracula.nvim',
  config = function()
    vim.cmd[[colorscheme dracula-soft]]
  end
  }

  use {'mfussenegger/nvim-dap'}
  use { 'leoluz/nvim-dap-go' }
  use { 'rcarriga/nvim-dap-ui' }
  use { 'theHamsta/nvim-dap-virtual-text' }
  use { 'nvim-telescope/telescope-dap.nvim' }

  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

  if packer_bootstrap then
    require("packer").sync()
  end
end)
