;;; early-init.el -*- lexical-binding: t; -*-

;; Disable GUI elements early
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Faster startup
(setq gc-cons-threshold most-positive-fixnum)

(setq package-enable-at-startup nil)

(setq inhibit-startup-screen t)

(setq frame-resize-pixelwise t)
