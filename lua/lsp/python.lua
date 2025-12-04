local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", -- Django fica mais suave
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        extraPaths = { "./" }, -- resolve imports em projetos Django
      },
    },
  },
})

