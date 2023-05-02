return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    name = "lsp_lines",
    keys = {
      { "<leader>ll", "<cmd>lua require('lsp_lines').toggle()<CR>", desc = "Toggle lsp_lines" },
    },
    config = function() require("lsp_lines").setup() end,
  },
}
