return {
	"mhartington/formatter.nvim",
	config = function()
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
				json = {
					function()
						return {
							exe = "prettier",
							args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width", "4", "--use-tabs", "false" },
							stdin = true,
						}
					end,
				},
				jsonc = {
					function()
						return {
							exe = "prettier",
							args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width", "4", "--use-tabs", "false" },
							stdin = true,
						}
					end,
				},
			},
		})

		-- Auto format ao salvar
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				local ft = vim.bo[args.buf].filetype
				if ft == "blade" or ft == "json" or ft == "jsonc" then
					vim.cmd("Format") -- formatter.nvim
				else
					vim.lsp.buf.format({ async = false }) -- LSP
				end
			end,
		})
	end,
}
