(sean-add-package 'scala-mode)
(require 'scala-mode)

(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.sbt$" . scala-mode))

(provide 'init-scala-mode)
