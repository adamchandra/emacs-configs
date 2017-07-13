;; These are snippets taken from  http://doc.norang.ca/org-mode.html

(defconst *orgfile-dir* (expand-file-name "/home/saunders/projects/the-livingroom/sys-config/org-files/"))

(require 'org-funcs)

(remove-hook 'org-mode-hook 'auto-complete-mode)

(setq org-directory *orgfile-dir*)
(setq org-default-notes-file (expand-file-name (concat *orgfile-dir* "refile-agenda.org")))
(setq org-journal-file (expand-file-name (concat *orgfile-dir* "journal.org")))

;; (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
(setq org-drawers (quote ("PROPERTIES" "CLOCK" "LOGBOOK" "HIDDEN" "MORE")))

(defun org-config-faces ()
  (interactive)
  (progn
    (setq org-todo-keywords
          (quote (
                  (sequence "[ ](t!)" "NEXT(n!)" "NOW(w!)" "HOLD(h!)"  "|" "[X](x!)")
                  ;; (sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                  ;; (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE")
                  )))

    (setq org-todo-keyword-faces
          (quote (("TODO"      :background "lightblue" :foreground "yellow"       :weight bold)
                  ("NEXT"      :background "yellow"    :foreground "blue"         :weight bold)
                  ("DONE"      :background "gray120"   :foreground "forest green" :weight bold)
                  ("WAITING"   :background "magenta"   :foreground "orange"       :weight bold)
                  ("HOLD"      :background "lightblue" :foreground "magenta"      :weight bold)
                  ("CANCELLED" :background "yellow"    :foreground "forest green" :weight bold)
                  )))

    ))

(org-config-faces)

; These don't work for some reason, so setting keys globally, rather than just in org-mode:
; (spacemacs/set-leader-keys-for-major-mode 'org-mode
; (evil-leader/set-key-for-mode 'org-mode

(evil-leader/set-key
  "o>" 'org-todo
  )

(provide 'org-config)
