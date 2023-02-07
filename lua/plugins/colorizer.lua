local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

colorizer.setup({
  user_default_options = {
    "*",
    "python",
    "rust",
    css = true,
    css_fn = true,
  },
})
