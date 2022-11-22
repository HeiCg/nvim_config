require("user.plugins")
require("user.settings")
require("user.colorscheme")
require("user.treesitter")
require("user.whichkey")
require("user.keymaps")
require("user.explorer")
require("user.cmp")
require("user.lsp")
require("lspsaga").init_lsp_saga({
  code_action_lightbulb = {
    virtual_text = false,
  },
})
require("user.trouble")
require("user.project")
require("user.telescope")
require("user.comment")
require("user.gitsigns")
require("user.lualine")
require("user.bufferline")
require("user.impatient")
require("user.alpha")
require("user.autopairs")
require("user.toggleterm")
require("user.autocommands")
require("colorizer").setup({
  user_default_options = {
    css = true,
    css_fn = true,
  },
})

vim.cmd([[
  augroup _syntax_symbols
    autocmd!
    autocmd BufwinEnter * :syntax match keyword "lambda" conceal cchar=λ
    autocmd BufwinEnter * :set conceallevel=1
  augroup end
]])
