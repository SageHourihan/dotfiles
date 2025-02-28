call plug#begin('~/.local/share/nvim/plugged')
" Colorscheme
Plug 'morhetz/gruvbox'
" File Explorer
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
" LSP and Mason
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" Autopairs
Plug 'windwp/nvim-autopairs'
" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'rafamadriz/friendly-snippets'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" Enable colorscheme
colorscheme gruvbox

" Basic settings
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set termguicolors
set background=dark
syntax on
filetype plugin indent on

" Define leader key
let mapleader = " "

" Key Mappings
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <leader>m :Mason<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
-- NvimTree Configuration
local nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")
if nvim_tree_ok then
  nvim_tree.setup({
    view = {
      width = 30,
    },
    filters = {
      dotfiles = false,
    },
  })
end

-- Mason and LSP Configuration
local mason_ok, mason = pcall(require, "mason")
if mason_ok then
  mason.setup()
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if mason_lspconfig_ok then
  mason_lspconfig.setup({
    -- Use the correct server names for Mason
    ensure_installed = { "html", "cssls", "intelephense" },
  })
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if lspconfig_ok then
  lspconfig.html.setup({})
  lspconfig.cssls.setup({})
  -- Use ts_ls instead of tsserver (deprecated)
  lspconfig.ts_ls.setup({})
  lspconfig.intelephense.setup({})
end

-- Autopairs Configuration
local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
if autopairs_ok then
  autopairs.setup({
    disable_filetype = { "TelescopePrompt" },
    disable_in_macro = true,
    check_ts = false,
    fast_wrap = {
      enable = true,
    }
  })
end

-- Telescope Configuration
local telescope_ok, telescope = pcall(require, "telescope")
if telescope_ok then
  telescope.setup({
    defaults = {
    },
    pickers = {
      find_files = {
          theme = "dropdown",
      },
      live_grep = {
          theme = "dropdown",
      },
      buffers = {
          theme = "dropdown",
      },
    },
    extensions = {
      fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
      }
    }
  })
  
  -- Load telescope extensions
  pcall(telescope.load_extension, 'fzf')
end

-- nvim-cmp Configuration
local cmp_ok, cmp = pcall(require, "cmp")
if cmp_ok then
  local luasnip_ok, luasnip = pcall(require, "luasnip")
  if luasnip_ok then
    pcall(require("luasnip.loaders.from_vscode").lazy_load)
    
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      }),
    })

    -- Filetype-specific configurations
    cmp.setup.filetype({'html', 'css', 'javascript', 'php'}, {
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      }),
    })

    -- Use buffer source for `/` and `?` (search)
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (command line)
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end
end

-- Treesitter Configuration
local treesitter_ok, _ = pcall(require, "nvim-treesitter.configs")
if treesitter_ok then
  require('nvim-treesitter.configs').setup({
    ensure_installed = { "html", "css", "javascript", "php", "lua", "vim" },
    highlight = {
      enable = true,
    },
  })
end
EOF
