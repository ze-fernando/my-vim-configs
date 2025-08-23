return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true, -- habilita a barra de comando
        view = "cmdline_popup", -- popup flutuante
      },
      views = {
        cmdline_popup = {
          position = {
            row = "40%", -- posição vertical
            col = "50%", -- centralizado
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
      },
      messages = { enabled = true }, -- mensagens do Neovim
      popupmenu = { enabled = true }, -- popup do autocompletar
    })
  end,
}
