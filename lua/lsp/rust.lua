local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
        experimental = {
          enable = true,
        },
      },

      cargo = {
        allFeatures = true,
      },

      checkOnSave = {
        command = "clippy",
      },

      completion = {
        autoimport = {
          enable = true,
        },
      },

      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },

      procMacro = {
        enable = true,
      },
    },
  },
})
