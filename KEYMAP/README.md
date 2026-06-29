# KEYMAP — keybindings grouped by demand

Keybindings for this configuration, organised by the **needs from `DEMAND.md`**
rather than by source file. Pick the workflow you're in:

| Demand | File | Covers |
| --- | --- | --- |
| Base editor | [editor.md](editor.md) | global keys, windows, completion, navigation, text editing |
| Source code reading & browsing | [coding.md](coding.md) | project search, xref/imenu, LSP (eglot), completion (corfu/cape), folding, diagnostics |
| Git workflow | [git.md](git.md) | magit, diff-hl |
| Markdown writing & reading | [markdown.md](markdown.md) | markdown-mode, distraction-free prose |
| Note-taking & knowledge (Org) | [org.md](org.md) | agenda, capture, links |
| Jupyter notebook replacement | [jupyter.md](jupyter.md) | Org Babel + Jupyter source blocks |
| Professional LaTeX editing | [latex.md](latex.md) | AUCTeX, CDLaTeX, RefTeX, latexmk |
| PDF reading & annotation | [pdf.md](pdf.md) | pdf-tools, org-noter |
| Research workspace | [research.md](research.md) | org-roam, citar/bibliography |

**Conventions**

- Keys are written in Emacs notation: `C-` = Control, `M-` = Meta/Alt,
  `S-` = Shift, `SPC`/`TAB`/`RET` as named.
- **(mode map)** means the key is only active inside that mode's buffers;
  everything else is global.
- Emacs' own defaults (`C-x C-s` save, `C-g` cancel, …) are not repeated.
- The trailing column is the `lisp/<layer>/init-*.el` module that sets the key.

See [`../docs/ARCHITECTURE.md`](../docs/ARCHITECTURE.md) for how the modules fit
together.
