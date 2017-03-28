;; 4.2 Org-Mode Setup

(require 'org-compat)
(require 'org)
;; (require 'org-fstree)

(defun bh/insert-inactive-timestamp ()
  (interactive)
  (org-insert-time-stamp nil t t nil nil nil))

(defun bh/insert-heading-inactive-timestamp ()
  (interactive)
  (save-excursion
    (org-return)
    (org-cycle)
    (bh/insert-inactive-timestamp)))


(provide 'org-funcs)
