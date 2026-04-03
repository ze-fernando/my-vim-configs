return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = { "lua", "vim", "javascript", "rust", "python" },
        highlight = { enable = true },
      })
    end,
  },
}
