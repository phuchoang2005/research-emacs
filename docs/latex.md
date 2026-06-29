# Professional LaTeX editing

AUCTeX + CDLaTeX + RefTeX, compiling with `latexmk` and previewing in pdf-tools
with SyncTeX. Keys: [`KEYMAP/latex.md`](../KEYMAP/latex.md).

## Module (`lisp/research/init-latex.el`)

| Concern | Configuration | Package |
| --- | --- | --- |
| Editing environment | AUCTeX in `LaTeX-mode` for `.tex`, with `TeX-auto-save` / `TeX-parse-self` for completion and `TeX-PDF-mode`. | auctex |
| Compilation | A `LaTeXmk` command (`latexmk -pdf -synctex=1 %s`) set as `TeX-command-default`; the PDF buffer auto-reverts after a build. | auctex + `latexmk` |
| Preview & sync | pdf-tools is the PDF viewer; `TeX-source-correlate-mode` enables forward/inverse SyncTeX search. | auctex, pdf-tools |
| Fast math | CDLaTeX templates and math-symbol shortcuts in `.tex` buffers. | cdlatex |
| References | RefTeX (built-in) for labels, `\ref` and `\cite`, plugged into AUCTeX. | reftex |

- External: a TeX distribution providing `latexmk`.
- `auctex` is declared with `:no-require t` because the package exposes no
  `auctex` feature to `require`; `:mode` activates `LaTeX-mode` for `.tex`.
- Bibliography insertion is shared with citar — see [research.md](research.md).
