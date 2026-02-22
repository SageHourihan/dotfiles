return {
  { "williamboman/mason.nvim", build = ":MasonUpdate", config = function() require("mason").setup() end },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "html", "cssls", "ts_ls", "intelephense", "eslint" },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(_, bufnr)
        local o = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, o)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, o)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, o)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, o)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, o)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, o)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, o)
      end

      -- Neovim 0.11+ native LSP API: set defaults for all servers
      vim.lsp.config("*", { capabilities = capabilities, on_attach = on_attach })

      -- eslint: override on_attach to add auto-fix on save
      vim.lsp.config("eslint", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", { buffer = bufnr, command = "EslintFixAll" })
        end,
      })

      vim.lsp.enable({ "html", "cssls", "ts_ls", "intelephense", "eslint" })
    end,
  },
}
