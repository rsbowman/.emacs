(sean-add-package 'deft)

(require 'deft)

(setq deft-text-mode 'org-mode)
(setq deft-extension "org")
(global-set-key [f8] 'deft)

(provide 'init-deft)
