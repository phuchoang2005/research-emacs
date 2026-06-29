# Jupyter notebook replacement

Org Babel turns an Org file into a notebook; emacs-jupyter adds real Jupyter
kernels. There are no custom global keybindings — work happens through Org's
source-block keys.

External requirements: `python3` with the `jupyter` package, and ZeroMQ (built
on first use). See `research/init-babel.el` and `research/init-notebook.el`.

## Working with source blocks — **(org-mode map)**

| Key | Action |
| --- | --- |
| `C-c C-c` | `org-babel-execute-src-block` (run the block at point) |
| `C-c '` | `org-edit-special` (edit the block in its native major mode) |
| `C-c C-v C-e` | execute block (explicit Babel prefix) |
| `C-c C-v C-b` | `org-babel-execute-buffer` (run every block) |
| `C-c C-v C-z` | switch to the block's session REPL |
| `C-c C-v C-t` | tangle the buffer to source files |

Inside `C-c '` edit buffers: `C-c '` again to return, `C-c C-k` to abort.

## Block templates

Type `<s` then `TAB` (or `C-c C-,`) to insert a block skeleton, e.g.:

```
#+begin_src python :session py :results output
print("hello")
#+end_src
```

Languages enabled: `emacs-lisp`, `python`, `shell`, `C`, and `jupyter-*` when a
kernel is available. python/shell/C/elisp run without a confirmation prompt.
