# Note-taking & knowledge management (Org)

Org as the hub: directory, agenda, capture and a clean visual style. The
notebook (Babel/Jupyter) and research (roam/citar) layers build on top in their
own docs. Keys: [`KEYMAP/org.md`](../KEYMAP/org.md).

## Module (`lisp/research/init-org.el`)

| Concern | Configuration | Package |
| --- | --- | --- |
| Files & agenda | `org-directory` = `~/org/`, `org-default-notes-file` = `inbox.org`, agenda over the whole directory. | org (built-in) |
| Capture | Templates for **task** (`t`), **note** (`n`) and dated **journal** (`j`) entries. | org-capture |
| Workflow | TODO sequence `TODO → NEXT → WAIT → DONE / CANCELLED`, with `org-log-done` and logging into a drawer. | org |
| Appearance | Indented startup, hidden emphasis markers, pretty entities, a `▾` ellipsis, native source fontification. | org |
| Styling | Modern rendering of headings/lists/tables/blocks; pretty heading bullets. | org-modern, org-superstar |

- No external dependencies for the core.
- **org-roam is deliberately *not* here** — DEMAND.md defers it to the research
  layer, so this module stays a clean Org core. See [research.md](research.md).
- Prose ergonomics (centred column, proportional font) come from the shared
  writing surface in [markdown.md](markdown.md).
