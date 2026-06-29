# Git workflow

Magit porcelain plus diff-hl fringe indicators.

| Key | Command | Module |
| --- | --- | --- |
| `C-x g` | `magit-status` (the main Git interface) | project/init-git |
| `C-c g` | `magit-file-dispatch` (actions for the current file) | project/init-git |
| `C-x M-g` | `magit-dispatch` (top-level Magit menu) | project/init-git |

## Inside the Magit status buffer (built-in)

| Key | Action |
| --- | --- |
| `s` / `u` | stage / unstage the item at point |
| `c c` | commit |
| `P p` | push |
| `F p` | pull |
| `b b` | switch branch |
| `TAB` | expand / collapse a section |
| `g` | refresh |
| `q` | quit, restoring the previous window layout |

> diff-hl shows added/changed/removed lines in the fringe of every file
> (no keybinding); it refreshes automatically around Magit operations.
> Project switching offers a "Magit" entry — see [coding.md](coding.md).
