# nvim

A minimal, fast, keyboard-first Neovim setup optimized for DevOps and backend work (Python, Go, TypeScript, YAML/K8s). Warm dark theme, quiet UI, on-demand completion, and logical keybindings.

## Requirements (macOS)
- Homebrew
- Neovim (latest), Node, Go, Python

Install essentials:

```bash
brew install neovim node go python ripgrep fd jq shfmt stylua
```

## Install
1) Clone into your config:

```bash
git clone git@github.com:DmarshalTU/nvim.git ~/.config/nvim
```

2) First run will auto-install plugins/tools:

```bash
nvim
```

3) Optional headless sync/check:

```bash
NVIM_APPNAME=nvim nvim --headless "+Lazy! sync" +qa
```

## What’s included
- LSP: `pyright`, `ruff`, `gopls`, `tsserver/ts_ls`, `yamlls`, `lua_ls`
- Treesitter: fast highlighting/indent for major langs
- Format on save: Ruff (py), gofumpt+goimports (go), Prettier(d) (ts/js/json/yaml), stylua (lua)
- Lint: ruff, golangci-lint, eslint_d, yamllint (on demand)
- Fuzzy find: Telescope
- File marks/jumps: Harpoon
- Terminal: floating toggle
- Zen Mode + Twilight: centered focus
- Theme: Kanagawa Dragon (warm dark)

## Keybindings (logical mnemonics)
- Find
  - `<leader>ff`: Find Files
  - `<leader>fg`: Find Grep (live text)
  - `<leader>fb`: Find Buffers
  - `<leader>fd`: Find Diagnostics
  - `<leader>fr`: Find Resume

- Files/Marks (Harpoon)
  - `<leader>a`: Add file (Add)
  - `<C-e>`: Harpoon list
  - `<leader>1..4`: Jump to slot 1..4

- Language (LSP)
  - `gd`/`gD`/`gr`/`gi`: goto definition/declaration/references/implementation
  - `K`: Hover
  - `<leader>rn`: Rename
  - `<leader>ca`: Code Action
  - `[d` / `]d`: Prev/Next Diagnostic
  - `<leader>f`: Format buffer

- YAML / K8s
  - `<leader>yp`: YAML Jump Path
  - `<leader>yv`: YAML Jump Value

- Terminal
  - `<C-\>`: Toggle Terminal (float)

- Windows
  - `<C-h/j/k/l>`: Move to split left/down/up/right

- Save/Quit
  - `<leader>w`: Write
  - `<leader>q`: Quit

- Zen
  - `<leader>zz`: Zen Mode toggle

- Completion (minimal)
  - `<C-Space>`: Trigger completion
  - `<Tab>/<S-Tab>`: Next/Prev candidate (or snippet jump)
  - `<CR>`: Confirm selection (no auto-select)

## Language specifics
- Python: Pyright + Ruff. Format on save with Ruff
- Go: gopls; gofumpt + goimports on save
- TypeScript/JS: tsserver; Prettier(d) on save
- YAML: yamlls + SchemaStore (Kubernetes-aware)

## Troubleshooting
- Run health checks: `:checkhealth`
- Manage plugins: `:Lazy`
- Manage tools: `:Mason`
- Reset plugin state (rare): remove `~/.local/share/nvim/lazy` then reopen `nvim`

## Update
```bash
nvim +"Lazy! sync" +qa
```

## Full usage and keybindings
- See `docs/USAGE.md` for the complete guide covering workflows and shortcuts.

## License
MIT
