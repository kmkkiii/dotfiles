vim.api.nvim_set_option_value('showmode', false, {})

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  config = function()
    require("lualine").setup {
      options = { theme = "auto" },
    }
  end,
}
