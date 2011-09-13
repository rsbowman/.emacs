(el-get-add
 '(:name deft
   :website "http://jblevins.org/projects/deft/"
   :description "simple note taking mode"
   :type git
   :url "http://jblevins.org/git/deft.git"
   :after (lambda () (deft-hooks))))
         
(defun deft-hooks () 
  (setq deft-directory (expand-file-name "~/docs/deft"))
  (global-set-key [f8] 'deft))

;; eg
;; (setq deft-text-mode 'markdown-mode)

(provide 'init-deft)