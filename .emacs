;; -*-Emacs-Lisp-*-
;; Jinx's default emacs init file.
;; For GNU/Linux & Windows XP-7 Machines

;; all roads lead home
(cd "~/.emacs.d")

;; set default load path
(setq load-path (cons "~/.emacs.d/" load-path))

;; Load theme path and my current theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'badwolf t)
(load-theme 'zenburn t)

;; Load evil plugin
;;(add-to-list 'load-path "~/.emacs.d/evil")
;;(require 'evil)
;; (evil-mode 0)

;; turn off welcome screen
(setq inhibit-startup-message t)

;; set frame size and position
;; (add-to-list 'default-frame-alist '(top . 1))
;; (add-to-list 'default-frame-alist '(left . 1))
;;(add-to-list 'default-frame-alist '(height . 57))
;;(add-to-list 'default-frame-alist '(width . 80))

;; Set the text for titlebar and icons
(if window-system
    (setq frame-title-format (list "GNU Emacs " emacs-version))
          icon-title-format "Emacs")

;; show column-number in mode line
(column-number-mode t)

;; turn on syntax highlighting
(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1))         ; GNU Emacs

;; turn on parentheses highlighting
(show-paren-mode 1)

;; disable backup files
(setq make-backup-files nil)

;; store saved places somewhere cleaner
(setq save-place-file "~/.emacs.d/saved-places")

;; highlight lines longer than 80 characters
;; This needs some work still
(require 'whitespace)
(setq whitespace-style (quote
  (face tab-mark lines-tail trailing)))
;;  (face tabs newline tab-mark newline-mark lines-tail)))
;;(global-whitespace-mode t)
(add-hook 'c-mode-hook
  (function (lambda () (whitespace-mode t))))
(add-hook 'c++-mode-hook
  (function (lambda () (whitespace-mode t))))

;; Multi-state TODO workflow
(setq org-todo-keywords
  '((sequence "TODO" "INCIPIENT" "IN PROGRESS" "|" "DONE")))

;; "Lose the UI"
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Set Linum-Mode on
;; (global-linum-mode t)
;; Linum-Mode and add space after the number
;; (setq linum-format "%d ")

;; Set the default font
;; (set-face-attribute 'default nil :font "Source Code Pro Light-12")

;; Tabs/Spaces for programming
;;(setq-default c-basic-offset 2)
;;(setq-default indent-tabs-mode nil)
(setq c-default-style "linux" c-basic-offset 2)
(add-hook 'c-mode-common-hook
      (lambda ()
        (local-set-key (kbd "RET") 'newline-and-indent)
        (setq indent-tabs-mode nil)
        (setq tab-width 2)))

;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(95))
(add-to-list 'default-frame-alist '(alpha 95))

(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-stop 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

