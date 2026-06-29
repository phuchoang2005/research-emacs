# PDF reading & annotation

pdf-tools renders PDFs natively; org-noter ties a PDF to an Org notes file.
No custom global keys — the bindings below are pdf-tools/org-noter defaults.
See `research/init-pdf.el`.

External requirement: poppler (the `epdfinfo` helper is built on first PDF open).

## Reading — **(pdf-view-mode map)**

| Key | Action |
| --- | --- |
| `n` / `p` | next / previous page |
| `SPC` / `S-SPC` | scroll up / down |
| `<` / `>` | first / last page |
| `g` | go to a specific page |
| `+` / `-` / `0` | zoom in / out / reset; `W` fit width, `P` fit page |
| `C-s` | `isearch` inside the document |
| `o` | outline (table of contents) |
| `r` | rotate |

## Annotation — **(pdf-view-mode map)**

| Key | Action |
| --- | --- |
| mouse drag | select text (then annotate) |
| `a h` | add a highlight on the selection |
| `a t` | add a text (note) annotation |
| `a m` | add a markup annotation |
| `a D` | delete the annotation at point |
| `C-c C-a l` | list all annotations |

## org-noter (PDF + notes side by side)

| Key | Action |
| --- | --- |
| `M-x org-noter` | start/resume a noting session from a PDF or its notes file |
| `i` | insert a note anchored to the current page/location |
| `M-p` / `M-n` | sync to the previous / next note |
| `q` | quit the session |
