require("rose-pine").setup({
  --- @usage 'main' | 'moon'
  dark_variant = "main",
})

-- set colorscheme after options
vim.cmd("colorscheme rose-pine")

-- vim.cmd([[colorscheme oh-lucy]]) -- for oh-lucy
-- vim.cmd([[colorscheme oh-lucy-evening]]) -- for oh-lucy-evening
