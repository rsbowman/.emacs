(require 'flyspell)

(defun point-in-re-p (re)
  "return true if point is in the middle of something matching re"
  (save-excursion
	  (let ((this (point-marker))
          (e (progn (end-of-line) (point-marker))))
	    (beginning-of-line)
	    (if (re-search-forward re e t)
          (and (>= this (match-beginning 0))
               (<= this (match-end 0)) )))))

;; avoid marking urls as misspelled
;; 
(defun my-flyspell-predicate ()
  (not (point-in-re-p "https?://[a-zA-Z0-9\\./-?&]*")))

(put 'text-mode 'flyspell-mode-predicate 'my-flyspell-predicate)

(add-hook 'text-mode-hook 'turn-on-flyspell)
(provide 'init-flyspell)