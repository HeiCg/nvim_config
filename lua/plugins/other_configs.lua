return {
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    config = function(_, opts)
      local animate = require("mini.animate")
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end
      local resize = {
        timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
      }
      local scroll = {
        timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
        subscroll = animate.gen_subscroll.equal({
          predicate = function(total_scroll)
            if mouse_scrolled then
              mouse_scrolled = false
              return false
            end
            return total_scroll > 1
          end,
        }),
      }
      animate.setup({
        resize = resize,
        scroll = scroll,
      })
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "python" },
        callback = function() vim.b.miniindentscope_disable = true end,
      })
    end,
    config = function(_, opts) require("mini.indentscope").setup(opts) end,
  },
}
