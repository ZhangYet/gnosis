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
