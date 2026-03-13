local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
      },
    },
  },
 imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      completion = {
        autoimport = {
          enable = true,
        },
      },
})
