return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v1.x",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",

		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		{ "EmranMR/tree-sitter-blade" },

		{ "mhartington/formatter.nvim" },
	},
	config = function()
		local lsp = require("lsp-zero").preset({})

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, opts)

			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end)

		lsp.ensure_installed({
			"pyright", -- Python
			"tsserver", -- JS/TS/TSX
			"rust_analyzer", -- Rust
			-- "clangd", -- C/C++
			-- "omnisharp", -- C#
			-- "jdtls", -- Java
			"intelephense", -- PHP
		})

		lsp.setup()

		-- Treesitter blade
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}
		vim.filetype.add({
			pattern = {
				[".*%.blade%.php"] = "blade",
			},
		})

		-- formatter.nvim blade
		require("formatter").setup({
			logging = false,
			filetype = {
				blade = {
					function()
						return {
							exe = "blade-formatter",
							args = { "--stdin" },
							stdin = true,
						}
					end,
				},
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.blade.php",
			callback = function()
				vim.cmd("Format")
			end,
		})
	end,
}
