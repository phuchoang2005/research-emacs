# Source code reading & browsing

Project search, symbol navigation, language-server actions, in-buffer
completion, folding and diagnostics. (Git lives in [git.md](git.md).)

## Symbol & reference navigation

| Key | Command | Module |
| --- | --- | --- |
| `M-g i` | `consult-imenu` (jump to a symbol in the buffer) | completion/init-navigation |
| `M-g d` | `xref-find-definitions` | completion/init-navigation |
| `M-g r` | `xref-find-references` | completion/init-navigation |

## Project

| Key | Command | Module |
| --- | --- | --- |
| `C-s` | `consult-line` (search current buffer) | project/init-project |
| `C-c f` | `consult-ripgrep` (search the project) | project/init-project |
| `C-c b` | `consult-buffer` | project/init-project |
| `C-c m` | `consult-imenu` | project/init-project |
| `C-c p p` | `project-switch-project` | project/init-project |
| `C-c p f` | `project-find-file` | project/init-project |
| `C-c p s` | `consult-ripgrep` (search the project) | project/init-project |

## In-buffer completion (corfu + cape)

| Key | Command | Module |
| --- | --- | --- |
| `TAB` / `S-TAB` | `corfu-next` / `corfu-previous` **(corfu map)** | programming/init-corfu |
| `C-c x p` | `completion-at-point` | programming/init-cape |
| `C-c x d` | `cape-dabbrev` (complete from open buffers) | programming/init-cape |
| `C-c x f` | `cape-file` (complete a file path) | programming/init-cape |
| `C-c x k` | `cape-keyword` (language keywords) | programming/init-cape |

## Folding & diagnostics

| Key | Command | Module |
| --- | --- | --- |
| `C-c @ @` | `hs-toggle-hiding` (fold/unfold block) **(prog-mode map)** | programming/init-prog |
| `M-n` / `M-p` | `flymake-goto-next-error` / `flymake-goto-prev-error` **(flymake map)** | programming/init-flymake |
| `C-c ! l` | `flymake-show-buffer-diagnostics` **(flymake map)** | programming/init-flymake |
| `C-c ! L` | `flymake-show-project-diagnostics` **(flymake map)** | programming/init-flymake |

## Language server (eglot) — **(eglot map)**

| Key | Command | Module |
| --- | --- | --- |
| `C-c l r` | `eglot-rename` | programming/init-eglot |
| `C-c l a` | `eglot-code-actions` | programming/init-eglot |
| `C-c l f` | `eglot-format` | programming/init-eglot |
| `C-c l d` / `C-c l h` | `eldoc` (show docs at point) | programming/init-eglot |

> `C-c l` is `org-store-link` globally, but acts as this LSP prefix inside
> eglot-managed buffers. Snippet expansion: type a key and press `TAB`
> (yasnippet). Tree-sitter highlighting is automatic where a grammar exists.
