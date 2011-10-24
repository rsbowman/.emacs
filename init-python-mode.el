(sean-add-package 'python)

(autoload 'python-mode "python" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-hook 'python-mode-hook 
          (lambda () (define-key python-mode-map "\C-m" 'newline-and-indent)))

(provide 'init-python-mode)
