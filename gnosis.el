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

(defun my-kill-thing-at-point (thing)
  "Kill the `thing-at-point' for the specified kind of THING."
  (let ((bounds (bounds-of-thing-at-point thing)))
    (if bounds
        (kill-region (car bounds) (cdr bounds))
      (error "No %s at point" thing))))

(defun my-kill-word-at-point ()
  "Kill the word at point."
  (interactive)
  (my-kill-thing-at-point 'word))
  
(defun link-current-word ()
  (interactive)
  (let ((word (current-word)))
    (progn
      (my-kill-word-at-point)
      (insert
       (format "[[https://dictionary.cambridge.org/dictionary/english/%s][%s]]" word word)))))

(defun link-content-in-current-heading ()
  "Link the word under current heading"
  (interactive)
  (save-restriction
    (org-narrow-to-subtree)
    (goto-char (point-min))
    (while (forward-word)
      (link-current-word))))
