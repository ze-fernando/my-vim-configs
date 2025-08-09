-- lua/user/mappings.lua
local opts = { noremap = true, silent = true }

-- Salvar com Ctrl+s (normal e insert mode)
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", opts)

-- Sair com q
vim.keymap.set("n", "q", ":q<CR>", opts)

-- Sair forçado com qq
vim.keymap.set("n", "qq", ":q!<CR>", opts)

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

vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
