# Git workflow

Magit porcelain plus diff-hl fringe indicators. Keys:
[`KEYMAP/git.md`](../KEYMAP/git.md).

## Module (`lisp/project/init-git.el`)

| Concern | Configuration | Package |
| --- | --- | --- |
| Git interface | `magit-status` on `C-x g`, full-frame display that restores the prior window layout on quit, word-level hunk refinement. | magit |
| Change indicators | `global-diff-hl-mode` + `diff-hl-flydiff-mode` show added/changed/removed lines live in the fringe; hooked into `magit-pre/post-refresh` so they stay in sync. | diff-hl |

- External: `git`
- The project-switch menu (see [coding.md](coding.md)) includes a
  `magit-project-status` entry, so `C-c p p` → choose a project → `Magit` opens
  its status buffer.

Magit clones a few dependencies on first install (`transient`, `with-editor`,
`llama`, `magit-section`); these are normal and tracked by straight.
