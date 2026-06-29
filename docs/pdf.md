# PDF reading & annotation

Native PDF rendering with pdf-tools and side-by-side note-taking with org-noter.
Keys: [`KEYMAP/pdf.md`](../KEYMAP/pdf.md).

## Module (`lisp/research/init-pdf.el`)

| Concern | Configuration | Package |
| --- | --- | --- |
| Rendering | `pdf-view-mode` for PDFs (via `:magic "%PDF"`), fit-page display, created annotations activated immediately. | pdf-tools |
| Deferred install | `pdf-loader-install` defers building the `epdfinfo` helper until a PDF is first opened, so loading the config headless is safe. | pdf-tools |
| Annotated notes | `org-noter` links a PDF to an Org notes file; notes search path points at `~/org/`. | org-noter |

- External: poppler — pdf-tools builds the `epdfinfo` server from it on first
  PDF open (not at config load).
- Combine with org-roam/citar ([research.md](research.md)) to keep reading
  notes inside the knowledge base, and with org-noter to anchor notes to exact
  PDF locations.
