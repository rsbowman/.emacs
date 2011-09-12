(el-get-add
 '(:name deft
   :website "http://jblevins.org/projects/deft/"
   :description "simple note taking mode"
   :type git
   :url "http://jblevins.org/git/deft.git"
   :after (lambda () (deft-hooks))))
         
(defun deft-hooks () 
  ())
;; eg
;; (setq deft-text-mode 'markdown-mode)
;; (global-set-key [f8] 'deft)

(provide 'init-deft)