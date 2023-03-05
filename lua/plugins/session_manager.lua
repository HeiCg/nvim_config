local status_ok, session_manager = pcall(require, "session_manager")
if not status_ok then
  return
end

session_manager.setup({})
local config_group = vim.api.nvim_create_augroup("MyConfigGroup", {})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = config_group,
  callback = function()
    if vim.bo.filetype ~= "git" and not vim.bo.filetype ~= "gitcommit" then
      session_manager.autosave_session()
    end
  end,
})
