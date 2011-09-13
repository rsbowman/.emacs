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
;; (add-to-list
;;  'el-get-sources
;;  '((:name python-mode
;;          :type emacsmirror
;;          :description "Major mode for editing Python programs"
;;          :features (python-mode doctest-mode)
;;          :compile nil
;;          :load "test/doctest-mode.el"
;;          :after (lambda () (python-mode-hook)))))

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(setq el-get-sources ())
(defun el-get-add (descr)
  (add-to-list 'el-get-sources descr 1))

;(el-get-add '(:name package))

(require 'init-settings)
(require 'init-python-mode)
(require 'init-auto-complete)
(require 'init-yasnippet)
(require 'init-deft)

(el-get 'sync)


;; my stuff
(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")

(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'text-mode-hook-identify)

