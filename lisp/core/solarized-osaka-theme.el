;;; solarized-osaka-theme.el --- Solarized Osaka -*- lexical-binding: t; -*-

;; A dark theme ported from craftzdog's solarized-osaka.nvim palette
;; (https://github.com/craftzdog/solarized-osaka.nvim). Colors converted
;; from the upstream HSL definitions to hex.

(deftheme solarized-osaka
  "Dark variant of Solarized, ported from the Solarized Osaka Neovim theme.")

(let ((class '((class color) (min-colors 89)))
      ;; Base scale (dark -> light)
      (base04   "#00141a")          ; background
      (base03   "#002d38")          ; bg highlight / current line
      (base02   "#073541")          ; region / selection
      (base01   "#586e74")          ; comments / dim text
      (base00   "#647a82")
      (fg       "#839495")          ; default foreground
      (base0    "#9fabad")
      (base1    "#adb8b8")          ; emphasized text
      (base2    "#ede7d4")
      (base3    "#fdf6e2")
      ;; Accents
      (yellow   "#b28600") (yellow-b   "#ffbf00")
      (orange   "#ca4c16") (orange-b   "#f84f0d")
      (red      "#dc312e") (red-b      "#f65351")
      (magenta  "#d33682") (magenta-b  "#f254a1")
      (violet   "#6d72c5") (violet-b   "#9ca0ed")
      (blue     "#278bd3") (blue-b     "#47adf5")
      (cyan     "#2aa298") (cyan-b     "#2beede")
      (green    "#859900") (green-b    "#b7fa00"))

  (custom-theme-set-faces
   'solarized-osaka

   ;; Basics
   `(default      ((,class (:background ,base04 :foreground ,fg))))
   `(cursor       ((,class (:background ,cyan-b))))
   `(region       ((,class (:background ,base02 :extend t))))
   `(highlight    ((,class (:background ,base02))))
   `(hl-line      ((,class (:background ,base03 :extend t))))
   `(fringe       ((,class (:background ,base04 :foreground ,base01))))
   `(secondary-selection ((,class (:background ,base03 :extend t))))
   `(shadow       ((,class (:foreground ,base01))))
   `(link         ((,class (:foreground ,blue :underline t))))
   `(link-visited ((,class (:foreground ,violet :underline t))))
   `(match        ((,class (:background ,yellow :foreground ,base04))))
   `(error        ((,class (:foreground ,red :weight bold))))
   `(warning      ((,class (:foreground ,orange :weight bold))))
   `(success      ((,class (:foreground ,green :weight bold))))
   `(escape-glyph ((,class (:foreground ,orange))))
   `(minibuffer-prompt ((,class (:foreground ,blue :weight bold))))
   `(trailing-whitespace ((,class (:background ,red))))

   ;; Line numbers
   `(line-number              ((,class (:foreground ,base01 :background ,base04))))
   `(line-number-current-line ((,class (:foreground ,base1 :background ,base03 :weight bold))))

   ;; Mode line
   `(mode-line          ((,class (:background ,base02 :foreground ,base1 :box (:line-width 1 :color ,base02)))))
   `(mode-line-inactive ((,class (:background ,base03 :foreground ,base00 :box (:line-width 1 :color ,base03)))))
   `(mode-line-emphasis ((,class (:foreground ,cyan :weight bold))))
   `(mode-line-highlight ((,class (:foreground ,magenta))))

   ;; Font lock
   `(font-lock-builtin-face       ((,class (:foreground ,violet))))
   `(font-lock-comment-face       ((,class (:foreground ,base01 :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,base01 :slant italic))))
   `(font-lock-doc-face           ((,class (:foreground ,base00 :slant italic))))
   `(font-lock-constant-face      ((,class (:foreground ,magenta))))
   `(font-lock-function-name-face ((,class (:foreground ,blue))))
   `(font-lock-keyword-face       ((,class (:foreground ,green))))
   `(font-lock-string-face        ((,class (:foreground ,cyan))))
   `(font-lock-type-face          ((,class (:foreground ,yellow))))
   `(font-lock-variable-name-face ((,class (:foreground ,blue-b))))
   `(font-lock-warning-face       ((,class (:foreground ,orange :weight bold))))
   `(font-lock-preprocessor-face  ((,class (:foreground ,orange))))
   `(font-lock-negation-char-face ((,class (:foreground ,red))))

   ;; Search
   `(isearch        ((,class (:background ,magenta :foreground ,base04 :weight bold))))
   `(isearch-fail   ((,class (:background ,red :foreground ,base3))))
   `(lazy-highlight ((,class (:background ,yellow :foreground ,base04))))

   ;; Parens
   `(show-paren-match    ((,class (:background ,cyan :foreground ,base04 :weight bold))))
   `(show-paren-mismatch ((,class (:background ,red :foreground ,base3 :weight bold))))

   ;; Completion (vertico / corfu / orderless / marginalia)
   `(vertico-current     ((,class (:background ,base02 :extend t))))
   `(corfu-default       ((,class (:background ,base03 :foreground ,fg))))
   `(corfu-current       ((,class (:background ,base02 :foreground ,base1))))
   `(corfu-border        ((,class (:background ,base01))))
   `(completions-common-part ((,class (:foreground ,blue :weight bold))))
   `(orderless-match-face-0 ((,class (:foreground ,blue :weight bold))))
   `(orderless-match-face-1 ((,class (:foreground ,magenta :weight bold))))
   `(orderless-match-face-2 ((,class (:foreground ,green :weight bold))))
   `(orderless-match-face-3 ((,class (:foreground ,yellow :weight bold))))
   `(marginalia-documentation ((,class (:foreground ,base01 :slant italic))))
   `(marginalia-key      ((,class (:foreground ,cyan))))

   ;; which-key
   `(which-key-key-face            ((,class (:foreground ,cyan :weight bold))))
   `(which-key-command-description-face ((,class (:foreground ,fg))))
   `(which-key-group-description-face   ((,class (:foreground ,blue))))

   ;; diff-hl / git gutter
   `(diff-hl-insert ((,class (:background ,green :foreground ,green))))
   `(diff-hl-delete ((,class (:background ,red :foreground ,red))))
   `(diff-hl-change ((,class (:background ,blue :foreground ,blue))))

   ;; Diff / magit basics
   `(diff-added   ((,class (:foreground ,green))))
   `(diff-removed ((,class (:foreground ,red))))
   `(diff-changed ((,class (:foreground ,yellow))))
   `(magit-section-heading ((,class (:foreground ,yellow :weight bold))))
   `(magit-branch-local    ((,class (:foreground ,blue))))
   `(magit-branch-remote   ((,class (:foreground ,green))))
   `(magit-diff-added      ((,class (:background ,base03 :foreground ,green))))
   `(magit-diff-removed    ((,class (:background ,base03 :foreground ,red))))

   ;; Flymake / flycheck
   `(flymake-error   ((,class (:underline (:style wave :color ,red)))))
   `(flymake-warning ((,class (:underline (:style wave :color ,orange)))))
   `(flymake-note    ((,class (:underline (:style wave :color ,cyan)))))

   ;; Org
   `(org-level-1   ((,class (:foreground ,blue    :weight bold :height 1.3))))
   `(org-level-2   ((,class (:foreground ,green   :weight bold :height 1.2))))
   `(org-level-3   ((,class (:foreground ,cyan    :weight bold :height 1.1))))
   `(org-level-4   ((,class (:foreground ,yellow  :weight bold))))
   `(org-level-5   ((,class (:foreground ,magenta :weight bold))))
   `(org-level-6   ((,class (:foreground ,violet  :weight bold))))
   `(org-level-7   ((,class (:foreground ,orange  :weight bold))))
   `(org-level-8   ((,class (:foreground ,red     :weight bold))))
   `(org-document-title ((,class (:foreground ,cyan-b :weight bold :height 1.5))))
   `(org-todo      ((,class (:foreground ,red :weight bold))))
   `(org-done      ((,class (:foreground ,green :weight bold))))
   `(org-link      ((,class (:foreground ,blue :underline t))))
   `(org-code      ((,class (:foreground ,magenta))))
   `(org-block     ((,class (:background ,base03 :extend t))))
   `(org-table     ((,class (:foreground ,blue))))
   `(org-date      ((,class (:foreground ,cyan :underline t))))
   `(org-special-keyword ((,class (:foreground ,base01))))

   ;; Tree-sitter font-lock faces (Emacs 29+ treesit highlighting)
   `(font-lock-bracket-face          ((,class (:foreground ,base0))))
   `(font-lock-delimiter-face        ((,class (:foreground ,base0))))
   `(font-lock-punctuation-face      ((,class (:foreground ,base0))))
   `(font-lock-misc-punctuation-face ((,class (:foreground ,base0))))
   `(font-lock-operator-face         ((,class (:foreground ,green))))
   `(font-lock-number-face           ((,class (:foreground ,magenta))))
   `(font-lock-escape-face           ((,class (:foreground ,orange))))
   `(font-lock-regexp-face           ((,class (:foreground ,cyan))))
   `(font-lock-property-name-face    ((,class (:foreground ,blue-b))))
   `(font-lock-property-use-face     ((,class (:foreground ,blue-b))))
   `(font-lock-variable-use-face     ((,class (:foreground ,blue-b))))
   `(font-lock-function-call-face    ((,class (:foreground ,blue))))

   ;; Eglot (LSP)
   `(eglot-highlight-symbol-face         ((,class (:background ,base02 :weight bold))))
   `(eglot-mode-line                     ((,class (:foreground ,cyan :weight bold))))
   `(eglot-diagnostic-tag-unnecessary-face ((,class (:foreground ,base01 :slant italic))))
   `(eglot-diagnostic-tag-deprecated-face  ((,class (:strike-through t :foreground ,base01))))
   `(eglot-inlay-hint-face               ((,class (:foreground ,base01 :height 0.85))))
   `(eglot-type-hint-face                ((,class (:foreground ,base01 :height 0.85))))
   `(eglot-parameter-hint-face           ((,class (:foreground ,base01 :height 0.85))))

   ;; Eldoc (used by eglot for docs/signatures)
   `(eldoc-highlight-function-argument   ((,class (:foreground ,yellow :weight bold))))

   ;; hl-todo / hl-line related
   `(hl-todo ((,class (:foreground ,orange :weight bold))))

   ;; Tab bar
   `(tab-bar             ((,class (:background ,base03 :foreground ,base00))))
   `(tab-bar-tab         ((,class (:background ,base04 :foreground ,base1 :weight bold))))
   `(tab-bar-tab-inactive ((,class (:background ,base03 :foreground ,base00))))

   ;; Misc
   `(vertical-border ((,class (:foreground ,base02))))
   `(window-divider  ((,class (:foreground ,base02))))
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,blue))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,green))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,magenta))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,yellow))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,cyan))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,violet))))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'solarized-osaka)

;;; solarized-osaka-theme.el ends here
