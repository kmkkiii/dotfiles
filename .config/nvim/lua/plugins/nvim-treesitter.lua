return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require('nvim-treesitter.configs').setup {
      event = { 'BufNewFile', 'BufReadPre' },

      ensure_installed = {
        "lua",
        "vim",
        "bash",
        "markdown",
        "json",
        "yaml",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "graphql",
        "python",
        "rust",
        "cpp",
        "ruby",
        "haskell",
      },

      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },

      indent = {
        enable = true,
      },
    }
  end,
}
