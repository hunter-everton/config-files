return {
	{ -- mini plugins
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},

	{ -- Show colors for hex codes, etc.
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	{ -- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ -- edit the file system as a buffer
		"stevearc/oil.nvim",
		opts = {
			keymaps = {
				["<C-s>"] = false,
				["<C-h>"] = false,
				["<C-l>"] = false,
			},
			view_options = {
				show_hidden = true,
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "-", ":Oil<cr>", desc = "oil" },
			{ "<leader>ef", ":Oil<cr>", desc = "edit [f]iles" },
		},
		cmd = "Oil",
	},

	{ -- terminal
		"akinsho/toggleterm.nvim",
		opts = {
			open_mapping = [[<C-\>]],
			direction = "float",
		},
	},

	{ -- show indent lines
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		main = "ibl",
		opts = {
			indent = { char = "│" },
			scope = { enabled = false },
		},
	},

	{ -- highlight markdown headings and code blocks etc.
		"lukas-reineke/headlines.nvim",
		enabled = true,
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("headlines").setup({
				quarto = {
					query = vim.treesitter.query.parse(
						"markdown",
						[[
                (fenced_code_block) @codeblock
                ]]
					),
					codeblock_highlight = "CodeBlock",
					treesitter_language = "markdown",
				},
				markdown = {
					query = vim.treesitter.query.parse(
						"markdown",
						[[
                (fenced_code_block) @codeblock
                ]]
					),
					codeblock_highlight = "CodeBlock",
				},
			})
		end,
	},

	{ -- comfy relative line numbers
		"mluders/comfy-line-numbers.nvim",
		config = function()
			require("comfy-line-numbers").setup({
				labels = {
					"1",
					"2",
					"3",
					"4",
					"5",
					"11",
					"12",
					"13",
					"14",
					"15",
					"21",
					"22",
					"23",
					"24",
					"25",
					"31",
					"32",
					"33",
					"34",
					"35",
					"41",
					"42",
					"43",
					"44",
					"45",
					"51",
					"52",
					"53",
					"54",
					"55",
					"111",
					"112",
					"113",
					"114",
					"115",
					"121",
					"122",
					"123",
					"124",
					"125",
					"131",
					"132",
					"133",
					"134",
					"135",
					"141",
					"142",
					"143",
					"144",
					"145",
					"151",
					"152",
					"153",
					"154",
					"155",
					"211",
					"212",
					"213",
					"214",
					"215",
					"221",
					"222",
					"223",
					"224",
					"225",
					"231",
					"232",
					"233",
					"234",
					"235",
					"241",
					"242",
					"243",
					"244",
					"245",
					"251",
					"252",
					"253",
					"254",
					"255",
				},
			})
		end,
	},
}
