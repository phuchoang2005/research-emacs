# Project: Building Original Emacs from Scratch

## Objectives

Do not use Doom Emacs, Centaur Emacs, or any distribution.

The goal is to build a standard GNU Emacs configuration (Original Emacs) using a modular architecture, serving the following needs:

- Professional LaTeX editing
- PDF reading and annotation
- Jupyter notebook replacement
- Note-taking and knowledge management using Organ Mode
- Markdown writing and reading
- Source code reading and browsing (full IDE not preferred)

- Git workflow

- Research workspace

---

# Construction Philosophy

Do not install packages haphazardly.

Instead, build using layers similar to an IDE architecture.

Text
Core

↓
UI
↓
Completion

↓
Navigation

↓
Project

↓
Programming

↓
Writing

↓
Organization

↓
LaTeX

↓
PDF

↓
Notebook

↓
Research Workspace

Each module performs only one function (Single Responsibility).

---

# Current Directory Structure

```text
~/.config/emacs/

early-init.el
init.el

lisp/

init-package.el
init-core.el
init-ui.el
init-font.el
init-theme.el
init-keybind.el

init-completion.el
init-navigation.el
init-project.el

init-window.el
init-editing.el

init-backup.el

backup/
snippets/
```

The `init.el` file is only used to load modules using `require`; no direct configuration is written within it.

---

# Completed

## Stage 1 – Bootstrap

- early-init.el
- init.el
- init-package.el

Using:

- straight.el
- use-package

Bootstrap successful.

---

## Stage 2 – Core

Configured:

- savehist
- recentf
- auto revert
- line number
- pixel scroll
- electric pair
- delete selection

---

## Stage 3 – UI

Configured:

- menu bar off
- tool bar off
- scroll bar off
- highlight line
- ​​show parentheses

Current theme used:

- modus-operandi

Fonts are separated in init-font.el.

---

## Stage 4 – Completion

Installed:

- Vertico
- Orderless
- Marginalia
- Consult
- Embark
- Embark-Consult
- Which-key

Warning resolved:

"The package embark-consult should be installed"

---

## Stage 5 – Editing

Added packages:

- avy
- expand-region
- hungry-delete
- rainbow-delimiters
- hl-todo

---

## Stage 6 – Navigation

Configured:

- consult-buffer
- consult-line
- ​​consult-imenu
- goto line
- ​​xref
- recentf

---

## Stage 7 – Window

Separated into a separate module.

Managed split window.

---

## Stage 8 – Backup

Moved backup to:

~/.config/emacs/backup/

instead of completely disabling it.

---

# Existing Packages

Completion

- vertico
- orderless
- marginalia
- consult
- embark
- embark-consult

Editing

- avy
- expand-region
- hungry-delete
- rainbow-delimiters
- hl-todo

Core

- project.el
- recentf
- savehist

Git

(Not installed)

Programming

(Not installed)

Writing

(Not installed)

---

# What to do next

## Next stage

### Stage 9 – Project Layer

Create:

- init-project.el
- init-git.el

Install:

- Magit
- diff-hl

Configure:

- project.el
- consult-ripgrep
- project-switch
- compile
- shell

---

### Stage 10 – Programming Layer

Split into multiple Module:

- init-prog.el
- init-eglot.el
- init-treesit.el
- init-flymake.el
- init-corfu.el
- init-cape.el
- init-snippet.el

Usage:

- eglot
- tree-sitter
- flymake
- corfu
- cape
- yasnippet

This will turn Emacs into a code reading and browsing environment.

---

### Stage 11 – Writing Layer

Create:

- init-writing.el

- init-markdown.el

Install:

- markdown-mode
- olivetti
- visual-fill-column
- mixed-pitch

Objective:

- read documentation
- write Markdown code
- preview

---

### Stage 12 – Organ Layer

Create:

- init-org.el

Initially install only:

- org

- org-modern
- org-superstar

Do not install Organ-roam.

---

### Stage 13 – LaTeX Layer

Create:

- init-latex.el

Install:

- AUCTeX
- CDLaTeX
- RefTeX

Then configure compilation using latexmk.

---

### Stage 14 – PDF Layer

Create:

- init-pdf.el

Install:

- pdf-tools
- org-noter

---

### Stage 15 – Notebook Layer

Create:

- init-babel.el

- init-notebook.el

Install:

- Org Babel
- ob-python
- ob-shell
- ob-C
- jupyter.el

---

### Stage 16 – Research Workspace

Finally install:

- org-roam
- citar
- bibliography
- templates
- journal
- capture workflow

This will be the layer that integrates the entire system.

---

# Desired Final Architecture

```text
lisp/

core/
package
core
ui
font
theme

completion/
completion
navigation

project/
project
git

programming/
eglot
treesit
flymake
corfu
cape
snippets

writing/
markdown
writing

research/
org
latex
pdf
notebook
roam
```

The ultimate goal is to have an Emacs configuration of approximately 2,000–3,000 lines, organized into clear modules, easy to maintain, and optimized for research, documentation, source code reading, and project development.
