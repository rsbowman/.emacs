;; Sean's emacs init file
;; great sources: https://github.com/purcell/emacs.d
;; https://github.com/technomancy/emacs-starter-kit
(push "/usr/local/bin" exec-path)

;; package.el stuff
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa"))
(require 'package)
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defun sean-add-package (p)
  (when (not (package-installed-p p))
    (package-install p)))
;;;

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(setq redisplay-dont-pause t)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(require 'cl)

;; add load paths
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(let* ((my-lisp-dir "~/.emacs.d/site-lisp/")
       (default-directory my-lisp-dir))
  (progn
    (setq load-path
          (append
           (loop for dir in (directory-files my-lisp-dir)
                 unless (string-match "^\\." dir)
                 collecting (expand-file-name dir))
           load-path))))

;; minor mode to hold my global key bindings
(defvar seans-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(defun sean-set-key (key fn)
  (define-key seans-keys-minor-mode-map key fn))

; per computer configuration
(let ((per-computer-config 
       (expand-file-name (concat "~/.emacs.d/init-" (system-name) ".el"))))
  (if (file-exists-p per-computer-config)
      (load per-computer-config)
    (error "no per computer config %s found!" per-computer-config)))

(require 'init-settings)
(require 'init-python-mode)
(require 'init-ruby-mode)
(require 'init-php-mode)
(require 'init-yasnippet)
;(require 'init-auto-complete)
(require 'init-deft)
(require 'init-latex)
(require 'init-org)
(require 'init-compile)
(require 'init-markdown)

;; Instead of this:
;(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")
;; Xmonad likes it better if .Xresources contains something like
;; Emacs.font: DejaVu Sans Mono-10
;; Emacs.fontBackend: xft
;; Emacs.menuBar: off
;; Emacs.toolBar: -1
;; Emacs.verticalScrollBars: off

(define-minor-mode seans-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " RSB" 'seans-keys-minor-mode-map)

(seans-keys-minor-mode 1)
(defun my-minibuffer-setup-hook ()
  (seans-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'text-mode-hook-identify)
