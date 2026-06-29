# Markdown writing & reading

Markdown editing plus the distraction-free prose surface shared by all text
buffers. Keys: [`KEYMAP/markdown.md`](../KEYMAP/markdown.md).

## Writing layer (`lisp/writing/`)

| Module | Responsibility | Key packages | External deps |
| --- | --- | --- | --- |
| `init-markdown` | `markdown-mode` (+ `gfm-mode` for READMEs), native code-block fontification, math, preview/export. | markdown-mode | `pandoc` (only for preview/export) |
| `init-writing` | The `my/prose-mode` surface: `visual-line-mode`, centred column (olivetti + visual-fill-column) and proportional body font (mixed-pitch). Added to `text-mode`, `markdown-mode` and `org-mode` hooks. | olivetti, visual-fill-column, mixed-pitch | — |

### Prose surface

`my/prose-mode` is one function that turns a buffer into a comfortable reading/
writing column. It is applied automatically via mode hooks, so Markdown, plain
text and Org all get the same treatment. Body text uses a proportional font
while code/blocks stay fixed-pitch (mixed-pitch).

This layer covers the "Markdown writing and reading" and "read documentation"
demands; the same prose surface also benefits Org (see [org.md](org.md)).
