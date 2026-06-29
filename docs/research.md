# Research workspace

The integrating layer: a Zettelkasten + journal over Org files (org-roam) and
bibliography/citation management (citar). Keys:
[`KEYMAP/research.md`](../KEYMAP/research.md).

## Module (`lisp/research/init-roam.el`)

| Concern | Configuration | Package |
| --- | --- | --- |
| Knowledge base | `org-roam-directory` = `~/org/roam/`, autosynced SQLite db, a default capture template, completion of node links everywhere. `C-c n …` bindings. | org-roam |
| Journal | `org-roam-dailies` in `journal/`, a dated capture template (`C-c n j` / `C-c n t`). | org-roam |
| Bibliography | citar reads `~/org/bib/references.bib`, opens attached PDFs/notes/URLs, and is wired as the `org-cite` insert/follow/activate processor. | citar |

- External: SQLite (for the roam db) and a `.bib` library at
  `~/org/bib/references.bib`. The roam directory is created at load so the db
  has somewhere to live.

### Why this is the integrating layer

It pulls the other demands together: notes and journal entries are Org files
([org.md](org.md)) that can embed executable blocks ([jupyter.md](jupyter.md)),
cite a shared bibliography that also feeds LaTeX ([latex.md](latex.md)), and
anchor reading notes to PDFs via org-noter ([pdf.md](pdf.md)). The result is a
single research environment rather than disconnected tools.
