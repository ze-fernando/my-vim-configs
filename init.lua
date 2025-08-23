require("config.lazy")
require("config.mappings")

vim.opt.clipboard = "unnamedplus"

-- Ativa números absolutos
vim.wo.number = true

-- Ativa números relativos (opcional)
vim.wo.relativenumber = true

vim.opt.fillchars:append("eob: ") -- remove o ~ das linhas "End Of Buffer"


vim.cmd.colorscheme("tokyonight")

-- Cor dos números das linhas normais
vim.api.nvim_set_hl(0, "LineNr", { fg = "#FF5555" }) -- vermelho claro, mude pra cor que quiser

-- Cor do número da linha do cursor (quando cursorline estiver ativo)
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFD700" }) -- dourado, mude se quiser

-- Ativa cursorline para destacar a linha atual
vim.o.cursorline = true
