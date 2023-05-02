return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  opts = {
    pip = {
      upgrade_pip = true,
      install_args = { "--index-url", "https://pypi.org/simple/" },
    },
    ensure_installed = {
      "stylua",
      "shfmt",
      "prettierd",
      "flake8", -- diagnostics
      "autopep8", -- formatter
      "black", -- formatter
      "isort", -- formatter
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")
    local function ensure_installed()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end
    if mr.refresh then
      mr.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
}
