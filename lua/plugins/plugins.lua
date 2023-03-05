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

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("windwp/nvim-autopairs")
  use({
    "lewis6991/impatient.nvim",
    config = function() require("impatient").enable_profile() end,
  })
  use("b0o/schemastore.nvim")
  use("ahmedkhalf/project.nvim")
  use("goolord/alpha-nvim")
  use("davidgranstrom/nvim-markdown-preview")
  use("NvChad/nvim-colorizer.lua")

  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "windwp/nvim-ts-autotag",
    },
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- file explorer
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  })

  -- key maps helper
  use("folke/which-key.nvim")

  use({
    "numToStr/Comment.nvim",
    config = function() require("Comment").setup() end,
  })

  -- status
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

  -- LSP
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "RRethy/vim-illuminate",
  })
  use("folke/trouble.nvim")
  use("glepnir/lspsaga.nvim")

  -- formatter
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use("onsails/lspkind.nvim")
  -- Snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("rafamadriz/friendly-snippets")

  -- Completitions
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      {
        "KadoBOT/cmp-plugins",
        config = function()
          require("cmp-plugins").setup({
            files = { ".*\\.lua" }, -- default
            -- files = { "plugins.lua", "some_path/plugins/" } -- Recommended: use static filenames or partial paths
          })
        end,
      },
    },
  })
  use({
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lua",

    "hrsh7th/cmp-nvim-lsp-document-symbol",

    "David-Kunz/cmp-npm",
    "lukas-reineke/cmp-under-comparator",
    "hrsh7th/cmp-nvim-lsp-signature-help",
  })

  use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")

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

  -- Term
  use({ "akinsho/toggleterm.nvim" })

  -- Packer
  use({
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  })
  use("ziontee113/color-picker.nvim")

  -- theme
  use({
    "rose-pine/neovim",
    as = "rose-pine",
    config = function() require("rose-pine").setup() end,
  })
  use("pineapplegiant/spaceduck")

  use({
    "jackMort/ChatGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
    },
  })

  use("Shatur/neovim-session-manager")
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
