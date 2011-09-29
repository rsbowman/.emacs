(sean-add-package 'python)

(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(autoload 'python-mode "python-mode" "Python editing mode." t)

(add-hook 'python-mode-hook 
          (lambda () (define-key python-mode-map "\C-m" 'newline-and-indent)))

(provide 'init-python-mode)
