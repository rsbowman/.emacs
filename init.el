;; Sean's emacs init file
;; great sources: https://github.com/purcell/emacs.d
;;
(push "/usr/local/bin" exec-path)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

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

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(setq el-get-sources ())
(defun el-get-add (descr)
  (add-to-list 'el-get-sources descr 1))

;; minor mode to hold my global key bindings
(defvar seans-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(defun sean-set-key (key fn)
  (define-key seans-keys-minor-mode-map key fn))

;(el-get-add '(:name package))

(require 'init-settings)
(require 'init-python-mode)
(require 'init-auto-complete)
(require 'init-yasnippet)
(require 'init-deft)
(require 'init-latex)

(el-get 'sync)

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
