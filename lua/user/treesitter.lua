local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.kind = "javascript"
ft_to_parser.kind2 = "javascript"
ft_to_parser.kindelia = "javascript"

configs.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autotag = { enable = true },
  autopairs = { enable = true },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
