(sean-add-package 'auctex)

(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 
          (lambda ()
            (sean-set-key "$" 'skeleton-pair-insert-maybe)))

(provide 'init-latex)
