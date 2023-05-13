-- start screen
return {
  {
    "goolord/alpha-nvim",
    enabled = true,
    event = "VimEnter",
    config = function()
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniStarterOpened",
          callback = function() require("lazy").show() end,
        })
      end
      local status_ok, alpha = pcall(require, "alpha")
      if not status_ok then
        return
      end

      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        [[   ███╗   ██╗██╗   ██╗██╗███╗   ███╗  ]],
        [[   ████╗  ██║██║   ██║██║████╗ ████║  ]],
        [[   ██╔██╗ ██║██║   ██║██║██╔████╔██║  ]],
        [[   ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║  ]],
        [[   ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║  ]],
        [[   ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  ]],
      }
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
        dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
        dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        dashboard.button("s", "  Session", ":lua require('persistence').load()]]"),
      }

      -- local function footer() return vim.env.USER end
      -- dashboard.section.footer.val = footer()
      dashboard.section.footer.val = "heicg"

      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "Include"
      dashboard.section.buttons.opts.hl = "Keyword"

      dashboard.opts.opts.noautocmd = true
      -- vim.cmd([[autocmd User AlphaReady echo 'ready']])
      alpha.setup(dashboard.opts)
    end,
  },
}
