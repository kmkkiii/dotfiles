return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'onsails/lspkind-nvim',
    'saadparwaiz1/cmp_luasnip'
  },
  {
    'L3MON4D3/LuaSnip',
    version = "v2.*",
    dependencies = {
      'rafamadriz/friendly-snippets',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load {
        paths = {
          vim.fn.stdpath 'data' .. '/lazy/friendly-snippets',
          -- './snippets',
        }
      }
    end,
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local map = cmp.mapping

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
    end

    cmp.setup {
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = map.scroll_docs(-4),
        ['<C-f>'] = map.scroll_docs(4),
        ['<C-Space>'] = map.complete(),
        ['<C-e>'] = map.abort(),
        ['<CR>'] = map.confirm { select = false },
        ['<Tab>'] = map(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = map(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      formatting = {
        format = require('lspkind').cmp_format {
          mode = 'symbol',
          preset = 'codicons',
        }
      }
    }

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources {
        { name = 'cmdline' },
        { name = 'path' },
      },
    })

    cmp.setup.cmdline { '/', '?' } {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources {
        {
          name = 'buffer',
          option = {
            keyword_pattern = [[\k\+]],
          }
        },
      },
    }
  end,
}
