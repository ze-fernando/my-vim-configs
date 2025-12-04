-- lua/user/mappings.lua
local opts = { noremap = true, silent = true }

-- Salvar com Ctrl+s (normal e insert mode)
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("n", "q", ":q", opts)
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", opts)

-- Não mandar deletes para o clipboard
vim.keymap.set({"n", "v"}, "c", '"_c')
vim.keymap.set({"n", "v"}, "x", '"_x')


-- Neo-tree toggle/focus/close com \
vim.keymap.set("n", "\\", function()
	local nt = require("neo-tree.sources.manager")
	local state = nt.get_state("filesystem")
	local win = state and state.winid

	local cur_win = vim.api.nvim_get_current_win()

	if win and vim.api.nvim_win_is_valid(win) then
		if cur_win == win then
			-- Se já estiver no Neo-tree, fecha
			vim.cmd("Neotree close")
		else
			-- Se Neo-tree aberto mas foco em outra janela, muda foco para Neo-tree
			vim.api.nvim_set_current_win(win)
		end
	else
		-- Neo-tree fechado, abre e foca
		vim.cmd("Neotree toggle")
	end
end, opts)

-- Telescope mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)

vim.keymap.set("n", "<leader>it", ":Inspect<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<PageUp>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<PageDown>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bc", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bb", ":BufferLinePick<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", ":BufferLinePickClose<CR>", { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader>/', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Abrir Mason com <leader>ms
vim.keymap.set("n", "<leader>ms", "<cmd>Mason<cr>", { desc = "Abrir Mason" })


-- Go to Definition 
vim.keymap.set('n', '<leader>gd', function()
  vim.lsp.buf.definition()
end, { noremap = true, silent = true, desc = 'Go to Definition' })

-- Lazygit
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true, desc = 'Abrir LazyGit' })
