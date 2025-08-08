-- lua/user/mappings.lua
local opts = { noremap = true, silent = true }

-- Salvar com Ctrl+s (normal e insert mode)
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", opts)

-- Sair com q
vim.api.nvim_set_keymap("n", "q", ":q<CR>", opts)

-- Sair forçado com qq
vim.api.nvim_set_keymap("n", "qq", ":q!<CR>", opts)

vim.api.nvim_set_keymap("n", "\\", "", {
  noremap = true,
  silent = true,
  callback = function()
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
  end,
})

