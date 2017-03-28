;; These are snippets taken from  http://doc.norang.ca/org-mode.html

(require 'org-funcs)

(setq org-directory *orgfile-dir*)
(setq org-default-notes-file (expand-file-name (concat *orgfile-dir* "refile-agenda.org")))
(setq org-journal-file (expand-file-name (concat *orgfile-dir* "journal.org")))


(provide 'org-config)
