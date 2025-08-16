## Neovim Minimal DevOps/Backend Guide

This guide explains the workflow, keybindings, and practical drills for this minimal, keyboard-first Neovim setup. It’s optimized for Python, Go, TypeScript, and YAML/Kubernetes work.

### Why this makes you faster
- Minimal UI and warm theme reduce eye strain and distractions
- One-keyboard workflow: fuzzy find, jump, LSP, format, terminal, YAML navigation
- Auto-format-on-save and diagnostics keep code clean with zero friction
- Harpoon bookmarks jump to your most-used files instantly
- Reproducible toolchain with automatic installers

---

## Install / Bootstrap
1) Prereqs (macOS):
```bash
brew install neovim node go python ripgrep fd jq shfmt stylua
```
2) Clone to your config:
```bash
git clone git@github.com:DmarshalTU/nvim.git ~/.config/nvim
```
3) First run:
```bash
nvim
```
4) Optional headless sync:
```bash
NVIM_APPNAME=nvim nvim --headless "+Lazy! sync" +qa
```

---

## Keybindings (think in English)
- Find
  - `<leader>ff`: Find Files
  - `<leader>fg`: Find Grep (live text)
  - `<leader>fb`: Find Buffers
  - `<leader>fd`: Find Diagnostics
  - `<leader>fr`: Find Resume

- Files/Marks (Harpoon)
  - `<leader>a`: Add (bookmark current file)
  - `<C-e>`: Harpoon list
  - `<leader>1..4`: Jump to slots 1..4

- Language (LSP)
  - `gd/gD/gr/gi`: goto definition/declaration/references/implementation
  - `K`: Hover docs
  - `<leader>rn`: Rename
  - `<leader>ca`: Code Action
  - `[d` / `]d`: Prev/Next Diagnostic
  - `<leader>f`: Format buffer

- YAML / Kubernetes
  - `<leader>yp`: YAML Jump Path
  - `<leader>yv`: YAML Jump Value

- Terminal
  - `<C-\>`: Toggle Terminal (float)

- Windows
  - `<C-h/j/k/l>`: Move to split left/down/up/right

- Save/Quit
  - `<leader>w`: Write
  - `<leader>q`: Quit

- Zen (focus)
  - `<leader>zz`: Zen Mode toggle (center + dim)

- Completion (minimal)
  - `<C-Space>`: Trigger completion
  - `<Tab>/<S-Tab>`: Next/Prev candidate (or snippet jump)
  - `<CR>`: Confirm (no auto-select)

---

## Language specifics
- Python
  - LSP: Pyright, diagnostics/format: Ruff
  - Typical loop: edit → save (auto-format) → `<C-\>` → `pytest -q`

- Go
  - LSP: gopls, format: gofumpt + goimports
  - Typical loop: edit → save → `<C-\>` → `go test ./...`

- TypeScript / JavaScript
  - LSP: tsserver, format: Prettier(d)
  - Typical loop: edit → save → `<C-\>` → `npm test` / `npm run dev`

- YAML / Kubernetes
  - LSP: yamlls + SchemaStore (Kubernetes-aware)
  - Navigate large manifests: `<leader>yp` / `<leader>yv`
  - Apply quickly: `<C-\>` → `kubectl apply -f file.yaml`

---

## Daily workflows to practice
- Harpoon Hotset
  - Open 3–5 core files with `<leader>ff`, then `<leader>a` to add each
  - Jump among them `<leader>1..4`

- Investigate Code
  - `gd` to definition, `gr` to references, `K` for docs
  - Rename safely with `<leader>rn>`

- Grep and Fix
  - `<leader>fg` then type query, hit `<CR>` to open, `<leader>f` to format

- Focus Mode
  - `<leader>zz` to center, present, or deep-work

---

## Maintenance and tools
- Plugins: `:Lazy`
- Tools (LSP/formatters/linters): `:Mason`
- Health: `:checkhealth`
- Update everything:
```bash
nvim +"Lazy! sync" +qa
```

---

## Troubleshooting
- Missing suggestions or LSP? Open `:Mason` and ensure servers are installed
- Formatting not running? Check filetype is supported in `conform.nvim`
- YAML schemas not loading? Ensure internet access for `SchemaStore.nvim`
- Reset plugin cache (rare): delete `~/.local/share/nvim/lazy` and reopen

---

## Tips
- Think commands as phrases: “Find Files” = `<leader>ff`, “Add (bookmark)” = `<leader>a`, “Zen-Zen” = `<leader>zz`
- Keep a floating terminal for tests and `kubectl` so you never leave Neovim
- Let format-on-save tidy code; use diagnostics navigation to fix quickly


