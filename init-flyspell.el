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
  (not (or (point-in-re-p "https?://[a-zA-Z0-9\\./-?&]*")
           (point-in-re-p "ht")
           (point-in-re-p "htt")
           (point-in-re-p "http")
           (point-in-re-p "https")))) ;; aaagh, really?  this is awful...

(put 'text-mode 'flyspell-mode-predicate 'my-flyspell-predicate)

(add-hook 'text-mode-hook 'turn-on-flyspell)
(provide 'init-flyspell)