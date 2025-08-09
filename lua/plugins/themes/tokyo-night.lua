return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm", -- "storm", "night", "moon" ou "day"
        transparent = false,
        styles = {
          sidebars = "dark",
          floats = "dark",
        },
      })

    end,
  },
}
