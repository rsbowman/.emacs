(sean-add-package 'yasnippet)

(require 'yasnippet)
(yas/initialize)
(setq yas/root-directory (expand-file-name "~/.emacs.d/snippets"))
(yas/load-directory yas/root-directory)
(yas/global-mode)

(provide 'init-yasnippet)