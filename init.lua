 require("config.lazy")
 require("config.mappings")

vim.opt.clipboard = "unnamedplus"

-- Ativa números absolutos
vim.wo.number = true

-- Ativa números relativos (opcional)
vim.wo.relativenumber = true

vim.opt.fillchars:append("eob: ")  -- remove o ~ das linhas "End Of Buffer"


vim.cmd.colorscheme("tokyonight")

