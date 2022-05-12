(require 'thingatpt)

(defun record-word-naive (word)
  (progn
    (open-line 1)
    (next-line)
    (insert
     (format "* %s :gnosis: " word))))

(defun current-word ()
  (interactive)
  (thing-at-point 'word 'no-properties))

(defun record-current-word ()
  (interactive)
  (record-word-naive 'current-word))

(defun link-current-word-to-link (link)
  (org-insert-link nil link 'current-word))

(defun link-current-word ()
  (interactive)
  (org-insert-link nil "https://dictionary.cambridge.org/" ))

