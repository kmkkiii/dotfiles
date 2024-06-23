return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("nvim-tree").setup {
      renderer = {
        highlight_git = true,
        highlight_opened_files = 'name',
        icons = {
          glyphs = {
            git = {
              unstaged = '!', renamed = '»', untracked = '?', deleted = '✘',
              staged = '✓', unmerged = '', ignored = '◌',
            },
          },
        },
      },

      actions = {
        expand_all = {
          max_folder_discovery = 100,
          exclude = { '.git', 'target', 'build' },
        },
      },

      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
    }
  end,
}
