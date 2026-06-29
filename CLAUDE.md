# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal GNU Emacs configuration. There is no application build, test suite, or
lint step — "running" it means starting Emacs and loading the config. Packages are
managed with [`straight.el`](https://github.com/radian-software/straight.el) +
`use-package`.

## Common commands

```bash
# Start Emacs with this config (it is the user-emacs-directory)
emacs

# Batch-load the full init to surface errors without opening a GUI
emacs --batch -l init.el

# Byte-compile a single module to check for warnings/errors
emacs --batch -f batch-byte-compile lisp/completion/init-completion.el
```

Inside Emacs:

- `M-x eval-buffer` — reload the current module after editing.
- `M-x straight-pull-all` / `M-x straight-rebuild-all` — update/rebuild packages.
- On first startup `straight.el` bootstraps itself (see `lisp/init-package.el`) and
  clones every `use-package`d package into `straight/repos/`.

## Architecture

Load flow: `early-init.el` (GUI/GC/startup tuning, runs before the package system)
→ `init.el` → each `lisp/<layer>/init-*.el` module.

The config is organized into IDE-style **layers**, each a subfolder of `lisp/`.
`init.el` adds every subfolder to the `load-path` (so module names stay flat —
`(require 'init-core)` regardless of folder), bootstraps packages via
`(require 'init-package)`, then `require`s each feature module **in a specific
order** — `init-package` must come first because `straight-use-package-by-default`
is set there and every later module relies on it. `init.el` holds no feature
configuration, only this wiring.

Each module is a self-contained feature area that ends with `(provide 'init-NAME)`:

| Layer / folder       | Modules                                                              | Responsibility                                                            |
| -------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `core/`              | `init-package`                                                       | straight.el bootstrap, `use-package` defaults (**loads first**)           |
| `core/`              | `init-core` / `init-ui`                                              | global editor behavior; faces, hl-line, show-paren                        |
| `core/`              | `init-theme` / `init-font`                                           | modus-operandi theme; Iosevka + SF Pro fonts                              |
| `core/`              | `init-keybind` / `init-window` / `init-backup`                      | global keys; window splits/movement; backup+autosave dirs                 |
| `completion/`        | `init-completion`                                                    | vertico / orderless / marginalia / consult / embark / which-key stack     |
| `completion/`        | `init-navigation`                                                    | consult/xref/imenu keybindings (`M-g …`, `C-x b`, `C-c r`)                |
| `editing/`           | `init-editing`                                                       | avy, expand-region, hungry-delete, rainbow-delimiters, hl-todo            |
| `project/`           | `init-project`                                                       | built-in `project.el`, root markers, `C-c p …`, `C-s`/`C-c f` binds       |
| `project/`           | `init-git`                                                           | magit (`C-x g`) + diff-hl                                                  |
| `programming/`       | `init-prog`                                                          | generic `prog-mode` defaults (hideshow folding, line numbers, subword)    |
| `programming/`       | `init-corfu` / `init-cape` / `init-snippet`                          | in-buffer completion (corfu+cape), yasnippet                              |
| `programming/`       | `init-treesit` / `init-flymake` / `init-eglot`                      | tree-sitter (treesit-auto), diagnostics, LSP (python/js/ts/c/c++/java→jdtls) |
| `writing/`           | `init-markdown` / `init-writing`                                     | markdown-mode; distraction-free prose (olivetti/visual-fill-column/mixed-pitch) |
| `research/`          | `init-org`                                                           | org core + org-modern + org-superstar (agenda, capture; **no roam here**) |
| `research/`          | `init-babel` / `init-notebook`                                       | Org Babel (python/shell/C) + jupyter kernels                              |
| `research/`          | `init-latex` / `init-pdf`                                            | AUCTeX/cdlatex/reftex + latexmk; pdf-tools + org-noter                    |
| `research/`          | `init-roam`                                                          | org-roam + citar/bibliography (the integrating layer, `C-c n …`)          |

See `docs/` (per-demand architecture docs) and `KEYMAP/` (per-demand keybinding
reference) for details; both are organized by user-facing need, not by file.

### External dependencies (checked lazily, only on first GUI use)

Headless load (`emacs --batch -l init.el`) only needs git + network to clone
packages. Features needing external programs: `rg` (project search), language
servers like `pylsp`/`clangd`/`jdtls` (eglot), a tree-sitter-enabled Emacs,
`pandoc` (markdown export), `python3`+`jupyter`+ZeroMQ (notebook), TeX+`latexmk`
(LaTeX), poppler/`epdfinfo` (pdf-tools), SQLite + a `.bib` file (roam/citar).

### Known duplication / gotchas

- `C-c p` is a **prefix** (`C-c p p` = `project-switch-project`, `C-c p f`,
  `C-c p s`) — do not bind `C-c p` directly to a command or loading errors with
  "starts with non-prefix key".
- `C-c r` (→ `recentf-open-files`) is bound in both `init-keybind` and
  `init-navigation` (same command, harmless).
- `C-c l` is `org-store-link` globally but the LSP prefix inside eglot buffers.
- When changing a key or shared option, grep across `lisp/` for every definition.

> Historical note: the eglot/treesit "provided-but-not-required" bug, the missing
> `init-git` require, and the duplicate `project-switch-commands` (which dropped
> the magit entry) have all been fixed.

## Conventions

- Every module file starts with a `;;; init-NAME.el … -*- lexical-binding: t; -*-`
  header and ends with `(provide 'init-NAME)`.
- Prefer `use-package` for external packages; use `:ensure nil` for built-ins
  (`project`, `recentf`, `xref`, `imenu`, `flymake`, `eglot`, `org`) so straight.el
  does not shadow them unnecessarily.
- New feature areas go in the appropriate `lisp/<layer>/init-*.el` and must be
  added to the `require` chain in `init.el` (not just `provide`d). If you add a new
  top-level layer folder, also add it to the `load-path` list in `init.el`.

### Commands

\*\*Note[> [!IMPORTANT]

> Priority using rtk proxy for bash commands. Example below]\*\*

#### Files

```bash
rtk ls .                        # Token-optimized directory tree
rtk read file.rs                # Smart file reading
rtk read file.rs -l aggressive  # Signatures only (strips bodies)
rtk smart file.rs               # 2-line heuristic code summary
rtk find "*.rs" .               # Compact find results
rtk grep "pattern" .            # Grouped search results
rtk diff file1 file2            # Condensed diff (exit 1 if files differ)
```

#### Git

```bash
rtk git status                  # Compact status
rtk git log -n 10               # One-line commits
rtk git diff                    # Condensed diff
rtk git add                     # -> "ok"
rtk git commit -m "msg"         # -> "ok abc1234"
rtk git push                    # -> "ok main"
rtk git pull                    # -> "ok 3 files +10 -2"
```

#### GitHub CLI

```bash
rtk gh pr list                  # Compact PR listing
rtk gh pr view 42               # PR details + checks
rtk gh issue list               # Compact issue listing
rtk gh run list                 # Workflow run status
```

#### Test Runners

```bash
rtk jest                        # Jest compact (failures only)
rtk vitest                      # Vitest compact (failures only)
rtk playwright test             # E2E results (failures only)
rtk pytest                      # Python tests (-90%)
rtk go test                     # Go tests (NDJSON, -90%)
rtk cargo test                  # Cargo tests (-90%)
rtk rake test                   # Ruby minitest (-90%)
rtk rspec                       # RSpec tests (JSON, -60%+)
rtk err <cmd>                   # Filter errors only from any command
rtk test <cmd>                  # Generic test wrapper - failures only (-90%)
```

#### Build & Lint

```bash
rtk lint                        # ESLint grouped by rule/file
rtk lint biome                  # Supports other linters
rtk tsc                         # TypeScript errors grouped by file
rtk next build                  # Next.js build compact
rtk prettier --check .          # Files needing formatting
rtk cargo build                 # Cargo build (-80%)
rtk cargo clippy                # Cargo clippy (-80%)
rtk ruff check                  # Python linting (JSON, -80%)
rtk golangci-lint run           # Go linting (JSON, -85%)
rtk rubocop                     # Ruby linting (JSON, -60%+)
```

#### Package Managers

```bash
rtk pnpm list                   # Compact dependency tree
rtk pip list                    # Python packages (auto-detect uv)
rtk pip outdated                # Outdated packages
rtk bundle install              # Ruby gems (strip Using lines)
rtk prisma generate             # Schema generation (no ASCII art)
```

#### AWS

```bash
rtk aws sts get-caller-identity # One-line identity
rtk aws ec2 describe-instances  # Compact instance list
rtk aws lambda list-functions   # Name/runtime/memory (strips secrets)
rtk aws logs get-log-events     # Timestamped messages only
rtk aws cloudformation describe-stack-events  # Failures first
rtk aws dynamodb scan           # Unwraps type annotations
rtk aws iam list-roles          # Strips policy documents
rtk aws s3 ls                   # Truncated with tee recovery
```

#### Containers

```bash
rtk docker ps                   # Compact container list
rtk docker images               # Compact image list
rtk docker logs <container>     # Deduplicated logs
rtk docker compose ps           # Compose services
rtk kubectl pods                # Compact pod list
rtk kubectl logs <pod>          # Deduplicated logs
rtk kubectl services            # Compact service list
rtk oc get pods                 # OpenShift pod summary
rtk oc get services             # OpenShift service list
rtk oc logs <pod>               # Deduplicated logs
```

#### Infrastructure as Code

```bash
rtk pulumi preview              # Strip header/URL/duration noise
rtk pulumi up                   # Compact apply output
rtk pulumi destroy              # Compact destroy output
rtk pulumi refresh              # Drift summary
rtk pulumi stack                # Stack metadata (strips owner/timestamps)
```

#### Data & Analytics

```bash
rtk json config.json            # Structure without values
rtk deps                        # Dependencies summary
rtk env -f AWS                  # Filtered env vars
rtk log app.log                 # Deduplicated logs
rtk curl <url>                  # Truncate + save full output
rtk wget <url>                  # Download, strip progress bars
rtk summary <long command>      # Heuristic summary
rtk proxy <command>             # Raw passthrough + tracking
```

```bash
rtk mvn *
```

If you need to run the docker command but it fails. You should run the command to start colima

```bash
colima start
```

And when stop the docker you should stop colima list-roles

```bash
colima stop
```
