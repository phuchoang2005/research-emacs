# Jupyter notebook replacement

Org Babel turns an Org file into a literate notebook; emacs-jupyter adds real
Jupyter kernels with inline results. Keys:
[`KEYMAP/jupyter.md`](../KEYMAP/jupyter.md).

## Notebook layer (`lisp/research/`)

| Module | Responsibility | Key packages | External deps |
| --- | --- | --- | --- |
| `init-babel` | Literate execution: load `emacs-lisp` / `python` / `shell` / `C` Babel languages, skip the confirmation prompt for those trusted languages, edit source blocks in the current window. | org (`ob-*`) | `python3`, a C compiler for those blocks |
| `init-notebook` | Register the `jupyter` Babel language so `#+begin_src jupyter-python …` blocks run against a live kernel; overlay results. | jupyter (emacs-jupyter) | `python3` + `jupyter`, ZeroMQ (`zmq`, built on first use) |

### How it works

A source block is evaluated in place with `C-c C-c`; results are inserted under
it. `init-babel` loads the standard languages eagerly (`with-eval-after-load
'org`); `init-notebook` appends `(jupyter . t)` so kernel-backed blocks become
available once emacs-jupyter has built its native ZeroMQ module on first use.

This satisfies the "Jupyter notebook replacement" demand without leaving Org —
notes, prose and executable code live in the same file.
