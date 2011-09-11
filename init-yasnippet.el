(el-get-add '(:name yasnippet
                    :after (lambda () (my-yasnippet-hook))))

(defun my-yasnippet-hook () 
  (setq yas/root-directory (expand-file-name "~/.emacs.d/snippets"))
  (yas/load-directory yas/root-directory))

(provide 'init-yasnippet)