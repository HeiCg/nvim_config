local name = function()
  if vim.env.VIRTUAL_ENV then
    return vim.env.VIRTUAL_ENV:sub(vim.env.VIRTUAL_ENV:find("/[^/]*$") + 1)
  end
end

return {
  before_init = function(_, config)
    config.settings.python.pythonPath = vim.env.VIRTUAL_ENV .. '/bin/python'
  end,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        diagnosticMode = "openFilesOnly"
      },
      venvPath = vim.env.VIRTUAL_ENV,
      venv = name()
    },
  },
}
