return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function(_, opts)
        if opts then
          require("luasnip").config.setup(opts)
        end
        vim.tbl_map(
          function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
          { "vscode", "snipmate", "lua" }
        )
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = {
      {
        "<tab>",
        function() return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>" end,
        expr = true,
        silent = true,
        mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },
  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      { "David-Kunz/cmp-npm", config = function() require("cmp-npm").setup({}) end },
      "lukas-reineke/cmp-under-comparator",
    },
    opts = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local luasnip = require("luasnip")
      local types = require("cmp.types")
      local has_words_before = function()
        local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      if not table.unpack then
        table.unpack = unpack
      end
      return {

        enabled = function()
          local context = require("cmp.config.context")
          if vim.api.nvim_get_mode().mode == "c" then
            return true
          else
            return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
          end
        end,

        completion = {
          completeopt = "menu,menuone,noinsert",
          autocomplete = { types.cmp.TriggerEvent.TextChanged },
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
          scrollbar = true,
        },

        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          -- disabled for autopairs mapping
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        }),

        sources = cmp.config.sources({
          {
            name = "nvim_lsp",
            entry_filter = function(entry) --, ctx)
              local kind = types.lsp.CompletionItemKind[entry:get_kind()]

              if kind == "Text" then
                return false
              end
              return true
            end,
            priority = 1000,
          },
          { name = "nvim_lua" },
          { name = "luasnip" },
          { name = "buffer", keyword_length = 4 },
          { name = "path" },
          { name = "npm", keyword_length = 4 },
        }),
        formatting = {
          format = function(entry, vim_item)
            if vim.tbl_contains({ "path" }, entry.source.name) then
              local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
              if icon then
                vim_item.kind = icon
                vim_item.kind_hl_group = hl_group
                return vim_item
              end
            end
            return lspkind.cmp_format({ with_text = false })(entry, vim_item)
          end,
        },
        experimental = {
          ghost_text = false,
        },
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      }
    end,
  },
}
