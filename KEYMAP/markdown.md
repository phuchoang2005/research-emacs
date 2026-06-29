# Markdown writing & reading

`markdown-mode` (with `gfm-mode` for READMEs) plus the distraction-free prose
surface that is enabled automatically in text/markdown/org buffers.

## markdown-mode — **(markdown map)**

| Key | Command | Module |
| --- | --- | --- |
| `C-c C-v` | `markdown-preview` (render in a browser) | writing/init-markdown |
| `C-c C-l` | `markdown-insert-link` | writing/init-markdown |

## Useful built-in markdown-mode keys

| Key | Action |
| --- | --- |
| `C-c C-s b` / `C-c C-s i` | bold / italic the region |
| `C-c C-s c` | inline code |
| `C-c C-c c` | compile/export via `markdown-command` (pandoc) |
| `C-c C-n` / `C-c C-p` | next / previous heading |
| `M-RET` | new list item |
| `TAB` | cycle heading visibility |

## Prose surface (automatic, no keys)

Opening any text/markdown/org buffer runs `my/prose-mode`: soft line wrapping
(`visual-line-mode`), a centred column (`olivetti` + `visual-fill-column`) and a
proportional body font (`mixed-pitch`). Toggle pieces manually with
`M-x olivetti-mode` / `M-x mixed-pitch-mode` if desired. — `writing/init-writing`
