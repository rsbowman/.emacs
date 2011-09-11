;; (add-to-list
;;  'el-get-sources
;;  '((:name python-mode
;;          :type emacsmirror
;;          :description "Major mode for editing Python programs"
;;          :features (python-mode doctest-mode)
;;          :compile nil
;;          :load "test/doctest-mode.el"
;;          :after (lambda () (python-mode-hook)))))
(el-get-add
 '(:name python
        :description "Python's flying circus support for Emacs"
        :type git
        :url "https://github.com/fgallina/python.el.git"
        :after (lambda () (python-mode-hook))))

(defun python-mode-hook ()
  (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
  (add-to-list 'interpreter-mode-alist '("python" . python-mode))
  (autoload 'python-mode "python-mode" "Python editing mode." t))

(provide 'init-python-mode)
