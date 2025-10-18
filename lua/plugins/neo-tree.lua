return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      require("neo-tree").setup({
        window = {
          mappings = {
            ["l"] = "open", -- tecla l funciona como Enter
            -- você pode adicionar outros mappings aqui
          },
        },
        -- outras configs que quiser
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = {
                ".git",
            },
          },
          follow_current_file = true,
          use_libuv_file_watcher = true,
        },
      })
    end,
  }
}
