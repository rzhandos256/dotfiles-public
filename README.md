# Dotfiles

> Personal macOS development environment configuration — optimized for speed, aesthetics, and productivity.

## Overview

A carefully curated collection of dotfiles for a **terminal-centric workflow** on macOS. Built around **Neovim**, **tmux**, **Alacritty**, and **skhd** — designed for Python/JavaScript/Lua development with a clean Solarized Light aesthetic.

## Quick Install

```bash
# Clone the repository
git clone <repo-url> ~/files/dotfiles-public

# Install all dependencies via Homebrew
brew bundle --file=~/files/dotfiles-public/Brewfile

# Symlink configurations
ln -sf ~/files/dotfiles-public/.aliass.zsh ~/.aliass.zsh
ln -sf ~/files/dotfiles-public/.tmux.conf ~/.tmux.conf
ln -sf ~/files/dotfiles-public/.vimrc ~/.vimrc
ln -sf ~/files/dotfiles-public/skhdrc ~/.config/skhd/skhdrc
ln -sf ~/files/dotfiles-public/alacritty ~/.config/alacritty
ln -sf ~/files/dotfiles-public/nvim ~/.config/nvim
```

## Stack

| Component | Tool | Description |
|-----------|------|-------------|
| **Terminal** | [Alacritty](https://github.com/alacritty/alacritty) | GPU-accelerated terminal with Solarized Light theme |
| **Shell** | Zsh | Custom aliases and productivity shortcuts |
| **Editor** | [Neovim](https://neovim.io/) | Lua-based config with lazy.nvim plugin manager |
| **Multiplexer** | [tmux](https://github.com/tmux/tmux) | Session persistence with tmux-resurrect/continuum |
| **Hotkeys** | [skhd](https://github.com/koekeishiya/skhd) | System-wide keyboard shortcuts for macOS |
| **Package Manager** | [Homebrew](https://brew.sh/) | Brewfile for reproducible installations |

## Neovim Configuration

### Architecture

```
nvim/
├── init.lua              # Entry point
└── lua/
    ├── config/
    │   ├── lazy.lua      # Plugin manager bootstrap
    │   ├── options.lua   # Editor options
    │   ├── keymaps.lua   # Global keymaps
    │   └── colors.lua    # Solarized Light highlight overrides
    └── plugins/
        ├── lsp.lua       # LSP servers (pyright, lua_ls, ts_ls, bashls, dockerls)
        ├── cmp.lua       # Autocompletion with nvim-cmp + LuaSnip
        ├── telescope.lua # Fuzzy finder with fzf-native
        ├── treesiter.lua # Treesitter + textobjects
        ├── lspsaga.lua   # LSP UI (hover, definition, rename, diagnostics)
        ├── conform.lua   # Auto-formatting on save
        ├── supermaven.lua# AI code completion
        ├── neotree.lua   # File explorer (float mode)
        ├── lualine.lua   # Minimal statusline
        ├── git.lua       # Gitsigns integration
        ├── solarized.lua # Colorscheme
        ├── which-key.lua # Keymap hints
        └── ...
```

### Key Plugins

| Plugin | Purpose |
|--------|---------|
| `nvim-lspconfig` + `mason.nvim` | LSP server management |
| `nvim-cmp` + `LuaSnip` | Autocompletion with VS Code snippets |
| `telescope.nvim` + `fzf-native` | Fuzzy file/grep/buffer search |
| `nvim-treesitter` | Syntax highlighting + text objects |
| `lspsaga.nvim` | Enhanced LSP UI (peek definition, finder, rename) |
| `conform.nvim` | Format on save (ruff, prettier, stylua, shfmt) |
| `supermaven-nvim` | AI-powered code completion |
| `neo-tree.nvim` | Floating file explorer |
| `gitsigns.nvim` | Git diff signs in signcolumn |
| `lualine.nvim` | Minimal Solarized Light statusline |

### Keymaps

#### General
| Keymap | Action |
|--------|--------|
| `<Space>` | Clear search highlight |
| `jk` (insert) | Exit to normal mode |
| `;` | Enter command mode |
| `Y` | Yank to end of line |
| `<leader>a` | Select all |
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>x` | Save and quit |
| `<leader>n` | New tab |

#### Navigation & Search
| Keymap | Action |
|--------|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fw` | Grep word under cursor |
| `<leader>fb` | Buffers |
| `<leader>fr` | Recent files |
| `<leader>e` | Toggle Neo-tree (float) |

#### LSP & Diagnostics
| Keymap | Action |
|--------|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gp` | Peek definition |
| `gh` | LSP finder (references, implementations) |
| `gl` | Line diagnostics |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename |
| `<leader>lo` | Outline |
| `<leader>rr` | Format buffer |
| `[d` / `]d` | Prev/next diagnostic |

#### Treesitter Text Objects
| Keymap | Action |
|--------|--------|
| `aa` / `ia` | Around/inside function call |
| `am` / `im` | Around/inside function |
| `ac` / `ic` | Around/inside class |
| `as` | Current scope |
| `<leader>ss` | Start incremental selection |
| `<leader>si` | Expand selection |
| `<leader>sd` | Shrink selection |

### LSP Servers

- **Python** — pyright
- **Lua** — lua_ls
- **TypeScript/JavaScript** — ts_ls
- **Bash** — bashls
- **Docker** — dockerls

### Formatters

- **Python** — ruff_format + ruff_organize_imports
- **JavaScript/TypeScript** — prettierd / prettier
- **Lua** — stylua
- **Bash** — shfmt (2-space indent)

## tmux Configuration

### Features
- **1-based indexing** for windows and panes
- **Mouse support** enabled
- **Solarized Light** minimal statusbar
- **Session persistence** via tmux-resurrect + tmux-continuum (auto-save/restore)

### Keymaps
| Keymap | Action |
|--------|--------|
| `Ctrl+l` | Next window |
| `Ctrl+h` | Previous window |
| `prefix + r` | Reload config |

### Plugins
- `tmux-plugins/tpm` — Plugin manager
- `tmux-plugins/tmux-sensible` — Sensible defaults
- `tmux-plugins/tmux-resurrect` — Session persistence
- `tmux-plugins/tmux-continuum` — Auto-save every 15 minutes

## Alacritty Configuration

- **Font**: JetBrainsMono Nerd Font (17pt)
- **Theme**: Solarized Light
- **Window**: Borderless decorations, dynamic padding
- **Custom keybindings**: Cmd+J/K for word navigation, Cmd+Shift+J/K for line start/end

## skhd — System Hotkeys

All bindings use `Alt` as the modifier:

| Shortcut | Action |
|----------|--------|
| `Alt + f` | Finder |
| `Alt + s` | Safari |
| `Alt + a` | Alacritty |
| `Alt + b` | Brave Browser |
| `Alt + t` | Telegram |
| `Alt + c` | Calculator |
| `Alt + n` | Notes |
| `Alt + d` | Docker |
| `Alt + k` | KeePassXC |
| `Alt + l` | Launchpad |
| `Alt + 1` | VS Code |
| `Alt + 2` | Terminal |
| `Alt + y` | Google Translate |
| `Alt + Shift + s` | Sublime Text |
| `Alt + Shift + d` | DaVinci Resolve |
| `Alt + Shift + t` | Open Trash |
| `Alt + Shift + i` | iTerm2 |

## Zsh Aliases

### Productivity
| Alias | Command |
|-------|---------|
| `v` | `nvim` |
| `c` | `pbcopy` |
| `o` | `open` |
| `hh` | `tldr` |
| `t` | `tree` |

### Config Shortcuts
| Alias | Action |
|-------|--------|
| `vconf` | Edit .vimrc |
| `nconf` | Edit Neovim config |
| `tconf` | Edit tmux config |
| `aconf` | Edit Alacritty config |
| `skconf` | Edit skhd config |
| `zconf` | Edit .zshrc |

### tmux
| Alias | Command |
|-------|---------|
| `tt` | `tmux new -s` |
| `ta` | `tmux attach -t` |
| `tls` | `tmux ls` |
| `tupd` | Reload tmux config |
| `tks` | Kill tmux server |

### Git
| Alias | Command |
|-------|---------|
| `gs` | `git status` |
| `gl` | `git log` |
| `gd` | `git diff` |

### Python
| Alias | Action |
|-------|--------|
| `ac` | Activate .venv (current or parent dir) |
| `ca` | Deactivate virtualenv |

## Scripts

### `ac.sh` — Smart venv activation
Automatically finds and activates `.venv` in current or parent directory.

### `new_bot.sh` — Project scaffolding
Creates a new project by copying the `userbot` template to `~/files/<project-name>`.

## Brewfile — Full Software List

### CLI Tools
`node`, `openssl@3`, `basedpyright`, `bat`, `curl`, `fd`, `ffmpeg`, `fzf`, `git`, `htop`, `lua-language-server`, `tree-sitter`, `neovim`, `pyright`, `redis`, `ripgrep`, `shellcheck`, `shfmt`, `stress`, `tldr`, `tmux`, `tree`, `tree-sitter-cli`, `uv`, `wget`, `xclip`, `opencode`

### macOS Apps
`autodesk-fusion`, `db-browser-for-sqlite`, `iterm2`, `lunar`, `maccy`, `mamp`, `the-unarchiver`

### Fonts
`SF Mono Nerd Font (Ligaturized)`

## Design Philosophy

- **Solarized Light** throughout — terminal, Neovim, tmux statusbar
- **Minimalism** — no unnecessary separators, clean statusline, transparent backgrounds
- **Speed** — zero debounce on cmp, fzf-native for telescope, lazy loading plugins
- **Keyboard-driven** — skhd for app launching, comprehensive Neovim keymaps, tmux navigation
- **Reproducible** — Brewfile for one-command dependency installation

## Security

`.gitignore` excludes:
- SSH keys, certificates, GPG data
- `.env` files and secrets
- Shell histories
- Swap/undo/shada files
- Plugin caches
- System files (`.DS_Store`, etc.)
