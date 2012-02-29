(sean-add-package 'yasnippet)

(require 'yasnippet)
(setq yas/root-directory (expand-file-name "~/.emacs.d/snippets"))
(yas/initialize)
(yas/load-directory yas/root-directory)
(yas/global-mode t)

(provide 'init-yasnippet)
