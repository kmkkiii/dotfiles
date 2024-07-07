return {
  "williamboman/mason.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    require("mason").setup {}

    local lsp = require 'lspconfig'

    require('mason-lspconfig').setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        }
      end,
      ['lua_ls'] = function()
        lsp.lua_ls.setup {
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
            },
          },
        }
      end,
    }
  end
}
