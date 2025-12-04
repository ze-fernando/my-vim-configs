return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v1.x",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- cmp
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },

  config = function()
    local lsp = require("lsp-zero").preset({})
    local lspconfig = require("lspconfig")

    -- bindings
    lsp.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end)

    -- mason
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",
        "intelephense",
        "rust_analyzer",
      },
    })

    -- carrega configuração por linguagem
    require("lsp")

    lsp.setup()
  end,
}

