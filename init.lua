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


-- Indentação padrão (4 espaços)
vim.opt.tabstop = 4      -- quantos espaços uma tab "vale"
vim.opt.shiftwidth = 4   -- quantos espaços usar ao indentar
vim.opt.expandtab = true -- converte Tab em espaços
vim.opt.smartindent = true -- indentação automática inteligente


-- Transparência geral
vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC",    { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Transparência no Neo-tree
vim.api.nvim_set_hl(0, "NeoTreeNormal",    { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC",  { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })

