local themes = {
	kanagawa = {
		"rebelot/kanagawa.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
	tokyonight = {
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			vim.cmd("colorscheme tokyonight-night")
		end,
	},
	catppuccin = {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
}

return themes.kanagawa
