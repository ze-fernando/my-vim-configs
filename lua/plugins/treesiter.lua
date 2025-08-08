return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- atualiza os parsers ao instalar
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "javascript", "python", "bash", "json" }, -- linguagens para instalar
      highlight = {
        enable = true, -- habilita destaque de sintaxe via treesitter
      },
      indent = {
        enable = true, -- habilita indentação inteligente
      },
      -- outras configs podem ser adicionadas aqui
    })
  end,
}
