return {
  "kevinhwang91/nvim-hlslens",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlslens").setup()
  end,
}
