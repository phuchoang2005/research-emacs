# Base editor

The foundation every other demand builds on: package bootstrap, global editor
behaviour, appearance, windows, minibuffer completion, navigation and text
editing. Keys: [`KEYMAP/editor.md`](../KEYMAP/editor.md).

## Core layer (`lisp/core/`)

| Module | Responsibility | Key packages | External deps |
| --- | --- | --- | --- |
| `init-package` | Bootstrap straight.el + use-package; set `straight-use-package-by-default`. **Loads first.** | straight.el, use-package | git, network (first run) |
| `init-core` | Global behaviour: no in-place backups/autosave/lockfiles, auto-revert, save-place, savehist, recentf, electric-pair, delete-selection, line/column numbers, pixel scroll. | built-ins | — |
| `init-ui` | Visual basics: default face height, no blinking cursor, hl-line, show-paren, spaces over tabs. | built-ins | — |
| `init-theme` | Loads the `modus-operandi` light theme and the frame title. | modus-themes (built-in) | — |
| `init-font` | Iosevka Nerd Font Mono (fixed-pitch) + SF Pro Text (variable-pitch). | — | the fonts installed locally |
| `init-keybind` | A few global keys (`<escape>`, `C-x k`, `C-c r`). | — | — |
| `init-window` | `windmove` Shift-arrow navigation and `C-x 0/1/2/3` window management. | built-ins | — |
| `init-backup` | Redirects backups to `backup/` and autosaves to the temp dir rather than disabling them. | built-ins | — |

## Completion layer (`lisp/completion/`)

| Module | Responsibility | Key packages |
| --- | --- | --- |
| `init-completion` | Minibuffer completion stack: vertico (UI), orderless (matching), marginalia (annotations), consult, embark + embark-consult, which-key, consult-dir. Case-insensitive. | vertico, orderless, marginalia, consult, embark, embark-consult, which-key, consult-dir |
| `init-navigation` | Buffer/file/symbol jumping on top of consult/xref/imenu/recentf (`C-x b`, `M-g i/l/r/d`). | consult + built-ins |

## Editing layer (`lisp/editing/`)

| Module | Responsibility | Key packages |
| --- | --- | --- |
| `init-editing` | Text-manipulation niceties: avy (jump to char), expand-region, hungry-delete, rainbow-delimiters, hl-todo. | avy, expand-region, hungry-delete, rainbow-delimiters, hl-todo |

> Note: minibuffer completion (vertico, here) and in-buffer completion (corfu,
> in [coding.md](coding.md)) are deliberately separate stacks that share
> orderless as the matching style.
