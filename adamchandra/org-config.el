;; These are snippets taken from  http://doc.norang.ca/org-mode.html

(defconst *orgfile-dir* (expand-file-name "/home/saunders/projects/the-livingroom/sys-config/org-files/orgs/"))

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
                  )));

    (setq org-todo-keyword-faces
          (quote (("TODO"      :background "lightblue" :foreground "yellow"       :weight bold)
                  ("[ ]"       :background ""          :foreground "blue"         :weight bold)
                  ("[X]"       :background "lightblue" :foreground "black"        :weight semi-bold)
                  ("NEXT"      :background "magenta"    :foreground "blue"         :weight normal)
                  ("NOW"       :background "yellow"  :foreground "blue"        :weight normal)
                  ("DONE"      :background "gray120"   :foreground "forest green" :weight bold)
                  ("WAITING"   :background "magenta"   :foreground "orange"       :weight bold)
                  ("HOLD"      :background "lightblue" :foreground "magenta"      :weight bold)
                  ("CANCELLED" :background "yellow"    :foreground "forest green" :weight bold)
                  )));


    ;; '(org-level-4 ((t (:foreground "#EA6300" :slant normal :weight bold :height 1.1))))
    (let (
          (ol1 '(:height 1.1 :weight bold :slant normal :overline "#A7A7A7" :foreground "#3C3C3C" :background "#F0F0F0"))
          (ol2 '(:height 1.0 :weight bold :slant normal :overline "#123555" :foreground "#923555" :background "#E5F4FB"))
          (ol3 '(:height 1.0 :weight bold :slant normal                     :foreground "#103522" :background nil ))
          (ol4 '(:height 1.0 :weight bold :slant normal                     :foreground "#0022AA"))
          (ol5 '(:height 1.0 :weight bold :slant normal                     :foreground "#000022"))
          (ol6 '(:height 1.0 :weight bold :slant normal                     :foreground "#B077CC"))
          (ol7 '(:height 1.0 :weight bold :slant normal                     :foreground "#0EAE2C"))
          (ol8 '(:height 1.0 :weight bold :slant italic                     :foreground "#FD8008"))
          (class t)
          )
      (custom-set-faces
       `(org-level-1 ((,class ,ol1)))
       `(org-level-2 ((,class ,ol2)))
       `(org-level-3 ((,class ,ol3)))
       `(org-level-4 ((,class ,ol4)))
       `(org-level-5 ((,class ,ol5)))
       `(org-level-6 ((,class ,ol6)))
       `(org-level-7 ((,class ,ol7)))
       `(org-level-8 ((,class ,ol8)))
       `(org-checkbox ((t (:background "aff8c0" :foreground "black" :weight semi-bold))))
       )
      );

    ))



(org-config-faces)

; These don't work for some reason, so setting keys globally, rather than just in org-mode:
; (spacemacs/set-leader-keys-for-major-mode 'org-mode
; (evil-leader/set-key-for-mode 'org-mode

;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶ ► • ★ ▸
;; '("►" "•" "★" "▸")
;; '("◉" "○" "✸" "✿")

;; http://nadeausoftware.com/articles/2007/11/latency_friendly_customized_bullets_using_unicode_characters
(setq org-bullets-bullet-list
      '("◉" "○" "■" "✸" "►" "•" )
      );

(evil-leader/set-key
  "o>" 'org-todo
  )
(provide 'org-config)
