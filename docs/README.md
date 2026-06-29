# Architecture — Original Emacs configuration

A hand-built GNU Emacs configuration (no Doom / Spacemacs / Centaur), organised
as IDE-style **layers** for research, writing, source-code reading and project
work. This folder documents the config one **demand** at a time, mirroring the
[`KEYMAP/`](../KEYMAP/) layout.

| Demand | Doc | Modules |
| --- | --- | --- |
| Base editor | [editor.md](editor.md) | core, ui, font, theme, keybind, window, backup, completion, navigation, editing |
| Source code reading & browsing | [coding.md](coding.md) | prog, corfu, cape, snippet, treesit, flymake, eglot, project |
| Git workflow | [git.md](git.md) | git |
| Markdown writing & reading | [markdown.md](markdown.md) | markdown, writing |
| Note-taking & knowledge (Org) | [org.md](org.md) | org |
| Jupyter notebook replacement | [jupyter.md](jupyter.md) | babel, notebook |
| Professional LaTeX editing | [latex.md](latex.md) | latex |
| PDF reading & annotation | [pdf.md](pdf.md) | pdf |
| Research workspace | [research.md](research.md) | roam, citar |

Keybindings for each demand are in the matching [`KEYMAP/`](../KEYMAP/) file.

---

## Design philosophy

- **Layers, not a pile of packages.** Each capability builds on the ones below:
  Core → UI → Completion → Navigation → Project → Programming → Writing → Org →
  LaTeX → PDF → Notebook → Research.
- **Single responsibility per module.** Every `lisp/<layer>/init-NAME.el`
  configures exactly one feature area and ends with `(provide 'init-NAME)`.
- **`use-package` + `straight.el`.** Built-ins are declared with `:ensure nil`
  so they aren't shadowed unnecessarily.

## Load flow

```
early-init.el          GUI/GC/startup tuning, before the package system
   │
init.el                load-path wiring + ordered (require ...) of every module
   │
lisp/<layer>/init-*.el  one feature area each, ending in (provide 'init-NAME)
```

1. **`early-init.el`** runs first (Emacs 27+): disables menu/tool/scroll bars,
   raises `gc-cons-threshold`, turns off built-in `package.el`, skips the splash.
2. **`init.el`** adds every `lisp/` subfolder to `load-path`, then `require`s the
   modules in dependency order. It holds **no feature configuration** — only
   wiring.
3. Each module loads in turn and configures its packages.

### The ordering rule (and why it matters)

`init-package` **must be required first**: it bootstraps straight.el and sets
`straight-use-package-by-default t`, which every later `use-package` relies on.
After that, order follows the layer stack so dependencies exist before use — e.g.
`init-org` loads before `init-babel` / `init-notebook` / `init-roam`, which
extend Org.

> **Gotcha that was fixed:** a module marked `(provide 'init-X)` *without* a
> matching `(require 'init-X)` is recorded as "already provided", so its file
> never loads. The previous `init.el` did this for `init-eglot` and
> `init-treesit`, silently disabling LSP and tree-sitter. They are now `require`d.

## Directory layout

```
lisp/
  core/        package, core, ui, font, theme, keybind, window, backup
  completion/  completion, navigation
  editing/     editing
  project/     project, git
  programming/ prog, corfu, cape, snippet, treesit, flymake, eglot
  writing/     writing, markdown
  research/    org, babel, notebook, latex, pdf, roam
```

`init.el` adds all seven subfolders to `load-path`, so module names stay flat
(`(require 'init-core)`) regardless of folder.

## External dependencies at a glance

Loading the config headless (`emacs --batch -l init.el`) only needs git +
network to clone packages. Several **features** need external programs, checked
lazily (only on first use in a GUI session):

| Tool | Needed by |
| --- | --- |
| `rg` (ripgrep) | project search ([coding.md](coding.md)) |
| language servers (`pylsp`, `clangd`, `jdtls`, …) | eglot ([coding.md](coding.md)) |
| tree-sitter-enabled Emacs | grammars ([coding.md](coding.md)) |
| git | Magit ([git.md](git.md)) |
| `pandoc` | Markdown preview/export ([markdown.md](markdown.md)) |
| `python3` + C compiler | Org Babel ([jupyter.md](jupyter.md)) |
| `python3` + `jupyter` + ZeroMQ | Jupyter kernels ([jupyter.md](jupyter.md)) |
| TeX + `latexmk` | LaTeX ([latex.md](latex.md)) |
| poppler (`epdfinfo`) | PDF tools ([pdf.md](pdf.md)) |
| SQLite + a `.bib` file | org-roam / citar ([research.md](research.md)) |

## Resolved issues & remaining notes

**Fixed during the Stage 9–16 build:**

- `init-eglot` / `init-treesit` are now `require`d (were `provide`d-only and
  never loaded); `init-treesit` was an empty stub and is now implemented.
- `init-git` is part of the require chain with real Magit/diff-hl config.
- `project-switch-commands` was set twice (the later `setq` dropped the Magit
  entry); it is now a single definition that keeps Magit.
- `C-c p` was bound both as a command and as the `C-c p f/s` prefix (a load
  error); `project-switch-project` moved to `C-c p p` so `C-c p` is a clean
  prefix.

**Remaining, harmless:**

- `C-c r` is bound to `recentf-open-files` in both `init-keybind` and
  `init-navigation` (same command).
- `C-c l` is `org-store-link` globally but the LSP prefix inside eglot buffers
  (eglot's minor-mode map wins there).

When changing any of these, grep across `lisp/` first — a few keys and options
are intentionally referenced from more than one module.

## Verification

```bash
# Load the whole config headless; first run clones every package.
emacs --batch -l init.el

# Byte-compile a single module to surface warnings.
emacs --batch -f batch-byte-compile lisp/programming/init-eglot.el
```

A clean run exits 0. Feature smoke-tests that need a GUI or external binaries
(pdf-tools, magit, LaTeX, Jupyter) are done by opening Emacs normally.
