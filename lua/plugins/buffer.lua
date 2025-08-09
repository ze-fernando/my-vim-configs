return  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        options = {
          numbers = "ordinal",        -- números nas abas
          close_command = "bdelete! %d", -- fechar buffer com comando do buffer
          right_mouse_command = "bdelete! %d",
          offsets = { { filetype = "neo-tree", text = "Neo Tree", padding = 1 } }, -- alinhamento com NvimTree
          show_close_icon = false,
          show_buffer_close_icons = true,
          separator_style = "none",
          enforce_regular_tabs = false,
          always_show_bufferline = true,
        }
      }
    end,
  }
