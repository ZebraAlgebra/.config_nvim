local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local conf = require "nvchad.configs.nvimtree"
      conf.view.side = "right"
      conf.filters.git_ignored = false
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_lua").lazy_load {
        paths = {
          "~/.config/nvim/lua/snippets/",
        },
      }
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = {
          "~/.local/share/nvim/lazy/friendly-snippets/",
        },
      }

      -- setup some luasnip configs
      require("luasnip").config.set_config { -- Setting LuaSnip config
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system paths
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
      },
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require "cmp"

      local luasnip = require "luasnip"

      local lspkind = require "lspkind"

      -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load()

      cmp.setup {
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = { -- configure how nvim-cmp interacts with snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(), -- close completion window
          ["<CR>"] = cmp.mapping.confirm { select = false },
          -- NOTE: testing
          ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        -- sources for autocompletion
        sources = cmp.config.sources {
          { name = "nvim_lsp" }, -- snippets
          { name = "luasnip" }, -- snippets
          { name = "buffer" }, -- text within current buffer
          { name = "path" }, -- file system paths
        },

        -- configure lspkind for vs-code like pictograms in completion menu
        formatting = {
          format = lspkind.cmp_format {
            maxwidth = 50,
            ellipsis_char = "...",
          },
        },
      }
    end,
  },
}
return plugins
