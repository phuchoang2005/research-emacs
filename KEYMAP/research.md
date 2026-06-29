# Research workspace

The integrating layer: a Zettelkasten + journal over Org files (org-roam) and
bibliography/citation management (citar). See `research/init-roam.el`.

External requirements: SQLite (for the roam database) and a `.bib` library at
`~/org/bib/references.bib`.

## org-roam — knowledge base & journal

| Key | Command | Module |
| --- | --- | --- |
| `C-c n f` | `org-roam-node-find` (find / create a note) | research/init-roam |
| `C-c n i` | `org-roam-node-insert` (link to a note) | research/init-roam |
| `C-c n c` | `org-roam-capture` | research/init-roam |
| `C-c n b` | `org-roam-buffer-toggle` (show backlinks) | research/init-roam |
| `C-c n j` | `org-roam-dailies-capture-today` (journal entry) | research/init-roam |
| `C-c n t` | `org-roam-dailies-goto-today` | research/init-roam |

## citar — bibliography & citations

| Key | Command | Module |
| --- | --- | --- |
| `C-c n r` | `citar-insert-citation` | research/init-roam |
| `C-c n o` | `citar-open` (open the PDF / note / URL for a reference) | research/init-roam |

> Citations work in Org (`org-cite`), and combine with LaTeX (RefTeX, see
> [latex.md](latex.md)) and PDF annotation (org-noter, see [pdf.md](pdf.md)) to
> form the full research loop. Notes live in `~/org/roam/`.
