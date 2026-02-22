# Neovim Cheat Sheet

**Leader key: `Space`**

---

## General

| Key | Action |
|-----|--------|
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>Q` | Force quit |
| `<leader>l` | Open Lazy (plugin manager) |
| `<leader>m` | Open Mason (LSP installer) |

---

## Navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between splits (left/down/up/right) |
| `gg` | Top of file |
| `G` | Bottom of file |
| `{` / `}` | Jump between blank lines |
| `<C-d>` / `<C-u>` | Half page down / up |
| `%` | Jump to matching bracket |

---

## File Tree (`nvim-tree`)

| Key | Action |
|-----|--------|
| `<leader>t` | Toggle file tree |
| `a` | Create file/directory |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `Enter` | Open file |
| `Tab` | Open without moving cursor |
| `H` | Toggle hidden files |
| `q` | Close tree |

---

## Telescope (fuzzy finder)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search file contents) |
| `<leader>fb` | Browse open buffers |
| `<leader>fh` | Search help tags |

**Inside Telescope:**

| Key | Action |
|-----|--------|
| `<C-j>` / `<C-k>` | Move down / up |
| `Enter` | Open selection |
| `<C-x>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |
| `<Esc>` | Close |

---

## LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Show references |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>d` | Show line diagnostics |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

---

## Completion (`nvim-cmp`)

| Key | Action |
|-----|--------|
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |
| `<Tab>` | Next item / expand snippet |
| `<S-Tab>` | Previous item |
| `<C-e>` | Close completion menu |
| `<C-f>` / `<C-b>` | Scroll docs down / up |

---

## Snippets (`LuaSnip`)

| Key | Action |
|-----|--------|
| `<Tab>` | Expand snippet / jump to next field |
| `<S-Tab>` | Jump to previous field |

---

## Buffers & Windows

| Key | Action |
|-----|--------|
| `:bn` / `:bp` | Next / previous buffer |
| `:bd` | Close buffer |
| `:sp` | Horizontal split |
| `:vsp` | Vertical split |

---

## Editing

| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment (if vim-commentary installed) |
| `ci"` | Change inside quotes |
| `di{` | Delete inside braces |
| `ya(` | Yank around parentheses |
| `>>`/ `<<` | Indent / dedent line |
| `u` | Undo |
| `<C-r>` | Redo |

---

## Visual Mode

| Key | Action |
|-----|--------|
| `v` | Character select |
| `V` | Line select |
| `<C-v>` | Block select |
| `>` / `<` | Indent / dedent selection |
| `y` | Yank selection |
| `d` | Delete selection |

---

## Treesitter

Treesitter powers syntax highlighting and smart indentation automatically for:
`html`, `css`, `javascript`, `typescript`, `php`, `lua`, `vim`

---

## Installed LSP Servers

| Server | Language |
|--------|----------|
| `html` | HTML |
| `cssls` | CSS / SCSS |
| `ts_ls` | JavaScript / TypeScript |
| `intelephense` | PHP |
| `eslint` | JS/TS linting (auto-fix on save) |

Manage servers with `:Mason`

---

## Plugin Management (`Lazy`)

| Command | Action |
|---------|--------|
| `<leader>l` | Open Lazy UI |
| `:Lazy sync` | Update all plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Lazy health` | Run health checks |
