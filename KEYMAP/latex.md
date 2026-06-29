# Professional LaTeX editing

AUCTeX + CDLaTeX + RefTeX, compiling with `latexmk` and previewing in
pdf-tools (with SyncTeX forward/inverse search). These packages bring their own
mode keymaps; the highlights are below. See `research/init-latex.el`.

External requirement: a TeX distribution providing `latexmk`.

## Compile & view — **(LaTeX-mode map)**

| Key | Command | Notes |
| --- | --- | --- |
| `C-c C-c` | `TeX-command-master` | runs the default command, set to **LaTeXmk** |
| `C-c C-a` | `TeX-command-run-all` | build and view in one step |
| `C-c C-v` | `TeX-view` | open the PDF (pdf-tools) |
| `C-c C-l` | `TeX-recenter-output-buffer` | show the compilation log |
| `C-c `` `` | `TeX-next-error` | jump to the next compile error |
| `C-c C-c SyncTeX` | — | `C-c C-v` does forward search; click in the PDF for inverse search |

## Structure & navigation — **(LaTeX-mode map)**

| Key | Action |
| --- | --- |
| `C-c C-s` | insert a sectioning command |
| `C-c C-e` | insert / close an environment |
| `C-c ]` | close the current environment |
| `C-c C-f C-b` / `C-f C-i` | bold / italic the region |

## References & citations (RefTeX) — **(LaTeX-mode map)**

| Key | Action |
| --- | --- |
| `C-c =` | `reftex-toc` (table of contents browser) |
| `C-c (` | `reftex-label` (create a label) |
| `C-c )` | `reftex-reference` (insert a `\ref`) |
| `C-c [` | `reftex-citation` (insert a `\cite`) |

## Fast math (CDLaTeX) — **(cdlatex-mode)**

| Key | Action |
| --- | --- |
| `` ` `` | math symbol prefix (e.g. `` `a `` → `\alpha`) |
| `'` | accent/modifier prefix on the previous char |
| `TAB` | expand a math template / jump between fields |

> Bibliography insertion via citar is shared with [research.md](research.md).
