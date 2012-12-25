(global-set-key [f9] 'compile)

(setq compilation-finish-functions 'compile-autoclose)
(defun compile-autoclose (buffer string)
  (cond ((string-match "finished" string)
         (bury-buffer "*compilation*")
         (winner-undo)
         (message "Build successful."))
        (t (message "Compilation exited abnormally: %s" string))))

(provide 'init-compile)
