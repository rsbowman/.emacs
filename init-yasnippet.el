(sean-add-package 'yasnippet)

(require 'yasnippet)
(setq yas-snippet-dirs
   '("~/.emacs.d/snippets"))
(yas-global-mode 1)
(setq yas/indent-line nil)

(provide 'init-yasnippet)
