(sean-add-package 'python)
(require 'python)

(electric-indent-mode -1)

(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
;(autoload 'python-mode "python-mode" "Python editing mode." t)

(add-hook 'python-mode-hook 
          (lambda () (define-key python-mode-map "\C-m" 'newline-and-indent)
            (set-variable 'py-indent-offset 4)))

(provide 'init-python-mode)
