(sean-add-package 'php-mode)

(autoload 'php-mode "php-mode" "PHP mode" t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(provide 'init-php-mode)
