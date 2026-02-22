return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "html", "css", "javascript", "typescript", "php", "lua", "vim", "vimdoc", "query" },
        auto_install = true,
        highlight = {
          enable = true,
          disable = function(_, buf)
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            return ok and stats and stats.size > 100 * 1024
          end,
        },
        indent = { enable = true },
      })
    end,
  },
}
