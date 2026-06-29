# Base editor

Foundational keys shared by every workflow: global commands, window
management, minibuffer completion, buffer/file navigation, and text editing.

## Global

| Key | Command | Module |
| --- | --- | --- |
| `<escape>` | `keyboard-escape-quit` (cancel / close minibuffer) | core/init-keybind |
| `C-x k` | `kill-current-buffer` | core/init-keybind |
| `C-c r` | `recentf-open-files` | core/init-keybind |

## Windows

| Key | Command | Module |
| --- | --- | --- |
| `S-<up>` / `S-<down>` / `S-<left>` / `S-<right>` | move focus between windows (`windmove`) | core/init-window |
| `C-x 2` | `split-window-below` | core/init-window |
| `C-x 3` | `split-window-right` | core/init-window |
| `C-x 1` | `delete-other-windows` | core/init-window |
| `C-x 0` | `delete-window` | core/init-window |

## Completion & file/buffer navigation

| Key | Command | Module |
| --- | --- | --- |
| `C-x C-f` | `find-file` | completion/init-navigation |
| `C-x b` | `consult-buffer` (switch buffer) | completion/init-navigation |
| `C-x C-d` | `consult-dir` (jump to a directory) | completion/init-completion |
| `M-g l` | `consult-goto-line` | completion/init-navigation |

## Text editing

| Key | Command | Module |
| --- | --- | --- |
| `M-j` | `avy-goto-char` (jump to a visible character) | editing/init-editing |
| `C-=` | `er/expand-region` (grow the selection) | editing/init-editing |

> Also active automatically (no keys): hungry-delete, rainbow-delimiters,
> hl-todo, electric-pair, delete-selection.
