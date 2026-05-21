# Neovim Config

Minimal, modern Neovim config using the built-in `vim.pack` plugin manager (Neovim 0.11+).

## Requirements

- Neovim 0.11+
- Git
- Node.js + npm (for `prettier`, `ts_ls`)
- `unzip` (for Mason to install some tools)
- `python3` + `pipx` (for `black`, `pyright`)

```sh
# Ubuntu/Debian
sudo apt-get install -y unzip pipx
pipx ensurepath
```

## First Launch

On first launch Mason will auto-install LSP servers. Run the following once to install formatters:

```
:MasonInstall black prettier stylua
```

---

## Plugins

| Plugin | Purpose |
|---|---|
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | Suite of small modules (see below) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and parsing |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybind popup hints |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configuration |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Mason ↔ lspconfig bridge |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Async code formatting |
| [catppuccin](https://github.com/catppuccin/nvim) | Colorscheme (mocha) |

### Active mini.nvim modules

| Module | What it does |
|---|---|
| `mini.basics` | Sensible default options and mappings |
| `mini.surround` | Add/delete/replace surrounding characters |
| `mini.icons` | File and UI icons |
| `mini.files` | File explorer |
| `mini.completion` | Completion with LSP support |
| `mini.snippets` | Snippet engine |
| `mini.pairs` | Auto-close brackets, quotes |
| `mini.comment` | Toggle comments |
| `mini.ai` | Enhanced text objects |
| `mini.statusline` | Statusline with diagnostics |
| `mini.indentscope` | Animated indent scope indicator |
| `mini.notify` | Floating notification popups |
| `mini.bracketed` | Bracket-based navigation mappings |
| `mini.move` | Move lines and selections |
| `mini.animate` | Smooth animations for cursor, scroll, resize, windows |

---

## LSP

Auto-installed via Mason on first launch:

| Server | Language |
|---|---|
| `lua_ls` | Lua |
| `pyright` | Python |
| `ts_ls` | TypeScript / JavaScript |

To add more servers: `:MasonInstall <server-name>`

---

## Formatting

Handled by `conform.nvim`. Runs synchronously before autosave.

| Filetype | Formatter |
|---|---|
| Python | `black` |
| TypeScript / TSX | `prettier` |
| JavaScript / JSX | `prettier` |
| JSON | `prettier` |
| YAML | `prettier` |
| Markdown | `prettier` |
| Lua | `stylua` |

---

## Autosave

Files are saved automatically after **1 second of inactivity** (`CursorHold`). Formatting runs before each save. Swap files are disabled since autosave makes them redundant.

---

## Keymaps

Leader key: `Space`

> Tip: press `<leader>?` at any time to see all keymaps for the current buffer via which-key.

### General

| Key | Action |
|---|---|
| `<leader>?` | Show buffer keymaps (which-key) |
| `<leader>e` | Open file explorer (mini.files) |
| `<leader>f` | Format buffer manually |

### Telescope (Fuzzy Finder)

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Browse open buffers |
| `<leader>fh` | Search help tags |

### LSP (active when a language server is attached)

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

### mini.surround

| Key | Action |
|---|---|
| `sa{motion}{char}` | Add surrounding (e.g. `saiwb` wraps word in `()`) |
| `sd{char}` | Delete surrounding |
| `sr{old}{new}` | Replace surrounding |

### mini.comment

| Key | Action |
|---|---|
| `gcc` | Toggle comment on current line |
| `gc{motion}` | Toggle comment on motion (e.g. `gcip` for paragraph) |

### mini.ai (text objects)

| Object | Selects |
|---|---|
| `af` / `if` | Around / inside function |
| `ac` / `ic` | Around / inside class |
| `aa` / `ia` | Around / inside argument |
| `a)` / `i)` | Around / inside parentheses |

### mini.move

| Key | Action |
|---|---|
| `<M-h/j/k/l>` | Move line or visual selection in that direction |

### mini.bracketed

| Key | Action |
|---|---|
| `[b` / `]b` | Previous / next buffer |
| `[c` / `]c` | Previous / next comment |
| `[t` / `]t` | Previous / next treesitter node |
| `[d` / `]d` | Previous / next diagnostic (also set by LSP) |

---

## Animation Tuning

All animation settings are variables at the top of the animate block in `init.lua`:

```lua
local ANIM_DURATION    = 50        -- ms total per animation
local ANIM_EASING      = 'in-out'  -- 'in' | 'out' | 'in-out'
local ANIM_TIMING      = 'exponential' -- 'linear' | 'quadratic' | 'cubic' | 'quartic' | 'exponential'
local ANIM_CURSOR_PATH = 'line'    -- 'line' | 'angle' | 'walls' | 'spiral'
local ANIM_WIN_EFFECT  = 'wipe'    -- 'static' | 'center' | 'wipe'
```
