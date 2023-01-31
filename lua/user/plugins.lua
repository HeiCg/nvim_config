local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  require("packer").packadd = "packer.nvim"
end

-- Autocommand that reloads neovim whenever you save the useins.lua file
local group = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | PackerInstall",
  pattern = "plugins.lua",
  group = group,
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function() return require("packer.util").float({ border = "rounded" }) end,
  },
})

-- Install your useins here
return packer.startup(function(use)
  -- Others
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("b0o/schemastore.nvim")
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use("folke/which-key.nvim")
  use("ahmedkhalf/project.nvim")
  use("lewis6991/impatient.nvim")
  use("goolord/alpha-nvim")
  use("davidgranstrom/nvim-markdown-preview")
  use("NvChad/nvim-colorizer.lua")

  -- comment
  use("numToStr/Comment.nvim") -- Easily comment stuff
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- colorscheme
  use("rose-pine/neovim")
  use("Yazeed1s/oh-lucy.nvim")

  -- LSP
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "RRethy/vim-illuminate",
  })
  use("folke/trouble.nvim")
  use("glepnir/lspsaga.nvim")

  -- linter and formatter
  use("jose-elias-alvarez/null-ls.nvim")

  -- virtual types
  use("jubnzv/virtual-types.nvim")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- Snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("rafamadriz/friendly-snippets")

  -- Completitions
  use({
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",

    "hrsh7th/cmp-nvim-lsp-document-symbol",

    "David-Kunz/cmp-npm",
    "KadoBOT/cmp-plugins",
  })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  })

  -- Git
  use("lewis6991/gitsigns.nvim")

  -- Status
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use({ "akinsho/bufferline.nvim" })

  -- Term
  use({ "akinsho/toggleterm.nvim" })
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all useins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
