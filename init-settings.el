(el-get-add
 '(:name smex				; a better (ido like) M-x
         :after (lambda ()
                  (setq smex-save-file "~/.emacs.d/.smex-items")
                  (sean-set-key (kbd "M-x") 'smex)
                  (sean-set-key (kbd "M-X") 'smex-major-mode-commands))))
(el-get-add 
 '(:name color-theme))
(el-get-add 
 '(:name color-theme-zenburn
         :after
         (lambda ()
           (autoload 'color-theme-zenburn "zenburn"
             "Just some alien fruit salad to keep you in the zone." t)
           (color-theme-zenburn))))


(require 'flyspell)
(setq flyspell-issue-welcome-flag nil)
(add-hook 'text-mode-hook 'turn-on-flyspell)

;;; ido
(require 'ido)
(ido-mode t)  ; use 'buffer rather than t to use only buffer switching
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

(defconst whitespace-delete-re
  "[ \t\n]+" "whitespace to delete")
(defun kill-word-ws ()
  (interactive)
  (if (looking-at whitespace-delete-re)
      (replace-match "")
    (kill-word 1)))
(sean-set-key "\ed" 'kill-word-ws)

(defun unfill-paragraph ()
  "Replace newline chars in current paragraph by single spaces.
This command does the reverse of `fill-paragraph'."
  (interactive)
  (let ((fill-column 90002000))
    (fill-paragraph nil)))

(defun unfill-region (start end)
  "Replace newline chars in region by single spaces.
This command does the reverse of `fill-region'."
  (interactive "r")
  (let ((fill-column 90002000))
    (fill-region start end)))

(require 'wc)
(sean-set-key "\C-cw" 'wc)

(autoload 'typing-speed-mode "typing-speed-mode" "Show typing speed in modeline")
(autoload 'turn-on-typing-speed "typing-speed-mode" "Show typing speed in modeline")
(add-hook 'text-mode-hook 'turn-on-typing-speed)

;; run catdoc on .doc files
(defun find-file-catdoc-hook ()
  (when (equal (file-name-extension buffer-file-name) "doc")
    (progn
      (shell-command-on-region (point-min) (point-max) "catdoc" t t)
      (unfill-region (point-min) (point-max)))))
(add-hook 'find-file-hook 'find-file-catdoc-hook)

;; open doc files with no auto fill
(defun doc-file-hook ()
  (when (equal (file-name-extension (buffer-name)) "doc")
    (progn
      (visual-line-mode 1)
      (auto-fill-mode -1))))
(add-hook 'text-mode-hook 'doc-file-hook)


(put 'eval-expression 'disabled nil)

(sean-set-key [home] 'beginning-of-line)
(sean-set-key [end] 'end-of-line)

(sean-set-key "\C-w" 'backward-kill-word)
(sean-set-key "\C-x\C-k" 'kill-region)
(sean-set-key "\C-c\C-k" 'kill-region)

; hippie exapnd
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))
(sean-set-key (kbd "C-;") 'hippie-expand)

(setq mouse-yank-at-point t)

(column-number-mode t)

(setq skeleton-pair t)
(sean-set-key "\"" 'skeleton-pair-insert-maybe)

(global-font-lock-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(require 'smooth-scrolling)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")
(sean-set-key [S-mouse-2] 'browse-url-at-mouse)

;; figure out when to use visual-line-mode/auto-fill-mode, possibly use
;; https://github.com/rafl/espect/blob/master/espect.el


(provide 'init-settings)

