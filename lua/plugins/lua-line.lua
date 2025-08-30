return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- ícones opcionais
  config = function()
    local function treesitter_status()
      local ts = vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()]
      return ts and "TS ✓" or "TS ✗"
    end

    require("lualine").setup({
      options = {
        theme = "auto", -- pode trocar pelo tema que quiser
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},     
			},
      sections = {
        lualine_a = { "mode" }, -- mostra o modo atual
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { treesitter_status }, -- mostra se o Treesitter está ativo
        lualine_y = { "filetype" },
        lualine_z = { "location" },
      },
    })
  end,
}
