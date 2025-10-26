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
	},
	config = function()
		local lsp = require("lsp-zero").preset({})

		lsp.on_attach(function(_, bufnr)
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format { async = true }
			end, opts)
		end)

		lsp.ensure_installed({ "pyright", "rust_analyzer", "intelephense" })
		lsp.setup()

		vim.lsp.config('intelephense', {
			settings = {
				intelephense = {
					environment = { includePaths = { "./vendor" } },
					files = {
						maxSize = 5000000,
						exclude = { "**/node_modules/**", "**/vendor/**/.git" },
					},
					stubs = {
						"apache", "bcmath", "bz2", "calendar", "Core", "ctype", "curl", "date",
						"dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm",
						"ftp",
						"gd", "gettext", "gmp", "hash", "iconv", "imap", "intl", "json", "ldap",
						"libxml", "mbstring", "meta", "mysqli", "oci8", "odbc", "openssl",
						"pcntl",
						"pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql",
						"Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop",
						"SimpleXML", "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3",
						"standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy",
						"tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl",
						"Zend OPcache", "zip", "zlib", "Laravel", "Eloquent"
					},
				},
			},
		})

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
			pattern = { [".*%.blade%.php"] = "blade" },
		})
	end,
}
