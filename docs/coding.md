# Source code reading & browsing

A reading/browsing-oriented IDE layer (intentionally *not* a heavy full IDE).
Responsibilities are split so each concern is independent and optional. Keys:
[`KEYMAP/coding.md`](../KEYMAP/coding.md).

## Project layer (`lisp/project/init-project.el`)

Built-in `project.el`: root markers (`.git`, `package.json`, `Cargo.toml`,
`go.mod`, `Makefile`, `pyproject.toml`, `.project`), the project-switch menu
(one de-duplicated definition that keeps the Magit entry), and consult search
entry points (`C-s`, `C-c f`, `C-c p …`).

- Packages: `project` (built-in), `consult`
- External: `rg` (ripgrep) for `consult-ripgrep`

> `C-c p` is a **prefix**, so `project-switch-project` lives on `C-c p p`
> (binding `C-c p` directly *and* `C-c p f` raises a non-prefix-key error).

## Programming layer (`lisp/programming/`)

| Module | Responsibility | Key packages | External deps |
| --- | --- | --- | --- |
| `init-prog` | Generic `prog-mode` defaults: code folding (hideshow), line numbers, hl-line, subword, indentation. Umbrella only — no overlap with the modules below. | built-ins | — |
| `init-corfu` | In-buffer completion popup (the counterpart to vertico), auto-popup + a docs popup. `corfu-popupinfo` is required from inside the corfu package, not installed separately. | corfu (+ corfu-popupinfo) | — |
| `init-cape` | Extra completion-at-point backends (dabbrev, file, keyword) feeding corfu. | cape | — |
| `init-snippet` | YASnippet template expansion; personal snippets live in `snippets/`. | yasnippet, yasnippet-snippets | — |
| `init-treesit` | Tree-sitter grammars via treesit-auto, guarded by `(treesit-available-p)`; deeper fontification. | treesit-auto | Emacs built with tree-sitter; grammars fetched on demand |
| `init-flymake` | On-the-fly diagnostics in `prog-mode` (`M-n`/`M-p`). Also surfaces eglot's LSP diagnostics. | flymake (built-in) | — |
| `init-eglot` | LSP client wired to python/js/ts/c/c++/java (jdtls); actions under `C-c l …`. Completion flows through corfu/cape, diagnostics through flymake. | eglot (built-in) | language servers on `PATH` (`pylsp`, `clangd`, `jdtls`, …) |

### How the pieces connect

`eglot` provides a `completion-at-point` function and `flymake` diagnostics;
`corfu` renders the candidates and `cape` adds non-LSP sources. So opening a
supported file gives you completion + diagnostics + go-to-definition with no
per-language setup beyond installing the server binary.
