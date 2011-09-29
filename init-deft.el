(sean-add-package 'deft)

(setq deft-directory (expand-file-name "~/docs/deft"))
(setq deft-text-mode 'org-mode)
(global-set-key [f8] 'deft)

(provide 'init-deft)