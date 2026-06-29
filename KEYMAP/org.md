# Note-taking & knowledge management (Org)

Org core: agenda, capture and links. The Zettelkasten/journal layer
(org-roam, citar) is in [research.md](research.md); literate code execution is
in [jupyter.md](jupyter.md).

## Global entry points

| Key | Command | Module |
| --- | --- | --- |
| `C-c a` | `org-agenda` | research/init-org |
| `C-c c` | `org-capture` (task / note / journal templates) | research/init-org |
| `C-c l` | `org-store-link` | research/init-org |

Capture templates (`C-c c` then the letter): `t` task, `n` note, `j` journal.

## Useful built-in Org keys — **(org-mode map)**

| Key | Action |
| --- | --- |
| `TAB` / `S-TAB` | cycle local / global heading visibility |
| `M-RET` | new heading or list item |
| `M-<left>` / `M-<right>` | promote / demote heading |
| `M-<up>` / `M-<down>` | move subtree up / down |
| `C-c C-t` | cycle TODO state (TODO → NEXT → WAIT → DONE → …) |
| `C-c C-s` / `C-c C-d` | set SCHEDULED / DEADLINE |
| `C-c C-l` | insert / edit a link |
| `C-c C-o` | open link at point |
| `C-c .` | insert a timestamp |
| `C-c C-c` | act on context (tags, checkboxes, tables, src blocks) |

> Headings render with `org-modern` + `org-superstar`; prose styling from the
> shared writing surface (see [markdown.md](markdown.md)).
