# Neovim configuration

Neovim setup with LSP support, completion and snippets, Telescope search, Tree-sitter highlighting, Neogit, and OpenCode integration. [lazy.nvim](https://github.com/folke/lazy.nvim) manages plugins and bootstraps itself on first launch; `lazy-lock.json` records plugin versions. The entry point is `init.lua`, with editor settings and personal mappings in `lua/dependencies/` and plugin specifications in `lua/plugins/`.

To use it, place the repository at `~/.config/nvim` and start `nvim`. You will need Git for plugin installation; [ripgrep](https://github.com/BurntSushi/ripgrep) is needed for Telescope live grep. Mason downloads selected language servers and tools, and Tree-sitter installs parsers. OpenCode actions require a working OpenCode installation. Run `:Lazy` to inspect plugins and `:Mason` to inspect installed tools.

The editor shows line numbers, wraps long lines, uses persistent undo (create `~/.vim/undodir` to store undo history), and checks for externally modified files. It uses tabs with a width of four by default, except YAML, which uses two spaces. Swap and backup files are disabled.

## Keyboard commands

`<leader>` is **Space**; `<C-x>` means **Ctrl+x**. `n` = normal mode, `v` = visual mode, `x` = visual selection mode, and `i` = insert/completion mode. Mappings below are the ones defined in this repository; plugin interfaces may also have their own context-specific keys. Use `:nmap`, `:vmap`, `:xmap`, or `:imap` to inspect all currently active mappings in a mode.

### Custom keybinds

Defined in `lua/dependencies/remap.lua` and `lua/dependencies/neogit.lua`.

| Mode | Keys | Action |
| --- | --- | --- |
| n | `<leader>pv` | Open the built-in netrw explorer (`:Ex`). |
| n | `<leader>wt` | Remove trailing whitespace throughout the current buffer. |
| v | `J` | Move the selected lines down and reselect/reindent them. |
| v | `K` | Move the selected lines up and reselect/reindent them. |
| n | `<C-g>` | Open Neogit. |
| n | `<leader>G` | Open Neogit. |

### Plugin keybinds

**Telescope** (`lua/plugins/telescope.lua`):

| Mode | Keys | Action |
| --- | --- | --- |
| n | `<leader>pf` | Find files. |
| n | `<leader>pg` | Live grep across files (requires ripgrep). |
| n | `<C-p>` | Find Git-tracked files. |

**LSP** (`lua/plugins/lspconfig.lua`): these buffer-local mappings become available when an LSP client attaches. Telescope-backed actions also require Telescope.

| Mode | Keys | Action |
| --- | --- | --- |
| n | `gR` | Find references in Telescope. |
| n | `gD` | Go to declaration. |
| n | `gd` | Find definitions in Telescope. |
| n | `gi` | Find implementations in Telescope. |
| n | `gt` | Find type definitions in Telescope. |
| n, v | `<leader>ca` | Show code actions (for the selection in visual mode). |
| n | `<leader>rn` | Rename symbol. |
| n | `<leader>D` | Show diagnostics for the current buffer in Telescope. |
| n | `<leader>d` | Show diagnostics at the cursor in a floating window. |
| n | `[d` | Go to previous diagnostic. |
| n | `]d` | Go to next diagnostic. |
| n | `K` | Show hover documentation. |
| n | `<leader>rs` | Restart the LSP (`:LspRestart`). |

**Completion** (`lua/plugins/nvim-cmp.lua`): these mappings apply in insert mode when completion is active.

| Mode | Keys | Action |
| --- | --- | --- |
| i | `<C-k>` | Select previous completion item. |
| i | `<C-j>` | Select next completion item. |
| i | `<C-b>` | Scroll completion documentation up. |
| i | `<C-f>` | Scroll completion documentation down. |
| i | `<C-Space>` | Open completion suggestions. |
| i | `<C-e>` | Dismiss completion. |
| i | `<CR>` | Confirm the explicitly selected item (does not auto-select one). |

**OpenCode** (`lua/plugins/opencode.lua`):

| Mode | Keys | Action |
| --- | --- | --- |
| n, x | `<leader>aa` | Ask OpenCode about `@this` (current context/selection). |
| n, x | `<leader>as` | Select an OpenCode action. |

### General Vim keybinds

Common built-in keys that are useful alongside this configuration. This is a quick reference, not the entire Vim command language; see `:help index` in Neovim for the full built-in key index. Plugin mappings above take precedence in their applicable modes (for example, `K` with an attached LSP and `J`/`K` in visual mode). Counts and motions can be combined with operators, such as `3j` or `d2w`.

| Context | Keys | Action |
| --- | --- | --- |
| Normal: move | `h` / `j` / `k` / `l` | Left / down / up / right. |
| Normal: move | `w` / `b` / `e` | Next word / previous word / end of word; uppercase `W` / `B` / `E` use whitespace-delimited WORDs. |
| Normal: move | `0` / `^` / `$` | Start of line / first nonblank character / end of line. |
| Normal: move | `gg` / `G` / `{number}G` | First line / last line / specified line. |
| Normal: move | `%` | Jump to a matching bracket. |
| Normal: move | `<C-u>` / `<C-d>` | Scroll up / down half a page. |
| Normal: move | `<C-b>` / `<C-f>` | Scroll up / down a page. |
| Normal: move | `<C-o>` / `<C-i>` | Move backward / forward through the jump list. |
| Normal: search | `/text<CR>` / `?text<CR>` | Search forward / backward. |
| Normal: search | `n` / `N` | Next / previous search match. |
| Normal: search | `*` / `#` | Search forward / backward for the word under the cursor. |
| Normal: edit | `i` / `a` / `I` / `A` | Insert before / after cursor / at start / at end of line. |
| Normal: edit | `o` / `O` | Open a new line below / above. |
| Normal: edit | `x` / `r{char}` / `R` | Delete a character / replace one character / enter replace mode. |
| Normal: edit | `dd` / `yy` / `p` / `P` | Delete line / yank line / paste after / paste before. |
| Normal: edit | `d{motion}` / `c{motion}` / `y{motion}` | Delete / change / yank through a motion (for example `dw`, `ciw`, `y$`). |
| Normal: edit | `u` / `<C-r>` / `.` | Undo / redo / repeat last change. |
| Normal: edit | `>>` / `<<` / `==` | Indent / unindent / reindent the current line. |
| Normal: edit | `J` | Join the next line to this one (visual `J` is remapped above). |
| Visual | `v` / `V` / `<C-v>` | Start characterwise / linewise / blockwise selection. |
| Visual | `y` / `d` / `c` / `>` / `<` | Yank / delete / change / indent / unindent selection. |
| Insert/visual | `<Esc>` | Return to normal mode. |
| Windows | `<C-w>s` / `<C-w>v` | Split horizontally / vertically. |
| Windows | `<C-w>h` / `<C-w>j` / `<C-w>k` / `<C-w>l` | Move between windows. |
| Normal: tabs | `gt` / `gT` | Go to next / previous tab. |
| Command line | `:w` / `:q` / `:wq` / `:q!` | Save / quit / save and quit / quit without saving. |
| Command line | `:e {file}` / `:bn` / `:bp` / `:bd` | Edit a file / next buffer / previous buffer / close buffer. |

## Plugins

All plugins declared by this configuration, including dependencies, are listed below. “No extra setup” means the plugin is installed but has no explicit configuration in this repository. The GitHub links point to the repositories named in the plugin specifications.

| Plugin | Purpose and configuration here |
| --- | --- |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager; bootstrapped in `lua/dependencies/init.lua`, loads `lua/plugins/`, with versions recorded in `lazy-lock.json`. |
| [rose-pine](https://github.com/rose-pine/neovim) | Color scheme; applied with `colorscheme rose-pine` in `lua/plugins/color.lua`. |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Parser-based syntax highlighting and indentation; `lua/plugins/treesitter.lua` ensures parsers for Vim docs, JS/TS, C, Lua, Rust, JSDoc, Bash, HTML, Ruby, Python, Nim, SQL, YAML and Java; auto-installs missing parsers, keeps Vim regex highlighting for Markdown, and registers a custom `templ` parser. Runs `:TSUpdate` on build. |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configuration in `lua/plugins/lspconfig.lua`; loads on opening/creating a file, sets buffer-local LSP keys and diagnostics, and configures HTML, TypeScript, CSS, GraphQL, Python, Helm, JSON, Java, Nim, Ruby, Rust, SQL, YAML, C/C++, C#, Docker, Go, Bash and Lua servers. Lua settings recognize the `vim` global and Neovim runtime files. |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | Provides LSP completion capabilities to `nvim-lspconfig`; configured in `lua/plugins/lspconfig.lua`. |
| [nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations) | Coordinates file operations with LSP servers; enabled via `config = true` as an LSP dependency. |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Installs external development tools; `lua/plugins/mason.lua` sets installed/pending/uninstalled UI icons. |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Mason/LSP bridge; ensures `lua_ls`, `helm_ls`, `rust_analyzer`, `clangd`, `jdtls`, `ruby_lsp`, `terraformls`, `ts_ls`, `yamlls`, `gopls`, and `pyright`, with automatic installation enabled. |
| [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Ensures `stylua`, `isort`, `black`, and `pylint` are installed (they are not wired to an on-save formatter in this repo). |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Insert-mode completion; `lua/plugins/nvim-cmp.lua` sets menu behavior, the keys above, and LSP, snippet, buffer, and path sources. |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Completion from text in the current buffer; enabled as an `nvim-cmp` source. |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | Filesystem-path completion; enabled as an `nvim-cmp` source. |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet expansion engine used by `nvim-cmp`; VS Code-style snippets load lazily. |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | Exposes LuaSnip snippets as an `nvim-cmp` completion source. |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection loaded through LuaSnip's VS Code snippet loader. |
| [lspkind.nvim](https://github.com/onsails/lspkind.nvim) | Adds pictograms to the completion menu; formatting is capped at width 50 with `...` for truncation. |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder; pinned to tag `0.1.5`, uses default setup and the file/Git/grep mappings above; LSP mappings also use Telescope pickers. |
| [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) | Telescope file-browser extension; installed as a dependency, but not explicitly loaded or mapped here. |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Shared Lua utility library used by Telescope, its file browser, and Neogit; no extra setup. |
| [neogit](https://github.com/NeogitOrg/neogit) | Git interface; default setup (`config = true`), opened with `<C-g>` or `<leader>G`. |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Diff views for Git workflows; included as an optional Neogit integration, with no extra setup. |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Fuzzy-finder option for Neogit; installed as an optional dependency, with no extra setup. |
| [opencode.nvim](https://github.com/nickjvandyke/opencode.nvim) | OpenCode integration; `lua/plugins/opencode.lua` defines ask/select mappings in normal and visual selection modes. |
| [mini.icons](https://github.com/nvim-mini/mini.icons) | Filetype and UI icons; no extra setup. |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | Filetype icons for compatible plugins; no extra setup. |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Available-key hint UI; installed without explicit setup or key registrations. |
| [neodev.nvim](https://github.com/folke/neodev.nvim) | Lua development support for Neovim; installed without explicit setup. |
| [neoconf.nvim](https://github.com/folke/neoconf.nvim) | Project-local LSP configuration support; lazy-loads on `:Neoconf`, with no extra setup. |

The Mason install list and the explicitly configured LSP server list are not identical: in particular, Mason lists `ts_ls`/`ruby_lsp`, while `lspconfig.lua` sets up `tsserver`/`ruby_ls`. Check those names if a language server does not attach.
