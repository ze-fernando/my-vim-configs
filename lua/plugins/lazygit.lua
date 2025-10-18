
return {
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit", -- carrega só quando chamar o comando
    config = function()
      vim.api.nvim_set_keymap(
        "n",
        "<leader>gg",
        ":LazyGit<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
