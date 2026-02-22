return {
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd("colorscheme gruvbox") end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup({
        view = { width = 30 },
        filters = { dotfiles = false },
        renderer = { group_empty = true },
      })
    end,
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
