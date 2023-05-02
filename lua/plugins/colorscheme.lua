return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    -- config = function()
    --   require("rose-pine").setup()
    --   vim.cmd([[colorscheme rose-pine]])
    -- end,
  },
  {
    "Yazeed1s/oh-lucy.nvim",
    lazy = false,
    -- priority = 1000,
    -- config = function()
    --   vim.o.background = "dark"
    --   vim.o.termguicolors = true
    --   vim.cmd([[colorscheme oh-lucy-evening]])
    -- end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.o.termguicolors = true
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          dark = "mocha",
        },
      })
      vim.cmd("colorscheme catppuccin-mocha")
    end,
  },
}
