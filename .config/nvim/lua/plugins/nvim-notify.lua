return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    notify = require 'notify'
    vim.notify = notify
  end,
}
