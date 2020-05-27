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
          (ol1 '(:height 0.9 :weight normal :slant normal :overline "#171717" :foreground "#3C3C3C" :background "#F0F0F0"))
          (ol2 '(:height 0.9 :weight normal :slant normal :overline "#123555" :foreground "#923555" :background "#E5F4FB"))
          (ol3 '(:height 0.9 :weight normal :slant normal                     :foreground "#103522" :background "#F0F0F0"))
          (ol4 '(:height 0.9 :weight normal :slant normal                     :foreground "#3022AA" :background "#F0F0F0"))
          (ol5 '(:height 0.9 :weight normal :slant normal                     :foreground "#300022" :background "#E5F4FB"))
          (ol6 '(:height 0.9 :weight normal :slant normal                     :foreground "#B077CC" :background "#F0F0F0"))
          (ol7 '(:height 0.9 :weight normal :slant normal                     :foreground "#AEAE2C" :background "#E5F4FB"))
          (ol8 '(:height 0.9 :weight normal :slant italic                     :foreground "#FD8008" :background "#E5F4FB"))
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

;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶ ► • ★ ▸
;; '("►" "•" "★" "▸")
;; '("◉" "○" "✸" "✿")

;; http://nadeausoftware.com/articles/2007/11/latency_friendly_customized_bullets_using_unicode_characters
(setq org-bullets-bullet-list
      '("◉" "○" "■" "✸" "►" "•" "✸" "►" "•")
      );
(defun literate-setup()
  (interactive)

  (org-babel-do-load-languages
   'org-babel-load-languages

   '((emacs-lisp . t)
     (dot . t)
     (ditaa . t)
     (python . t)
     (js . t)
     ;; (scala . t)
     (ammonite . t)
     (browser . t)
     (typescript . t)
     (ruby . t)
     (gnuplot . t)
     (clojure . t)
     (ledger . t)
     (org . t)
     (plantuml . t)
     (shell . t)
     (latex . t))
   )

  (setq org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-babel-results-keyword "results"
        )
  )

(literate-setup)


(evil-leader/set-key
  "o>" 'org-todo
  "obx" 'org-babel-execute-src-block
  )
(provide 'org-config)
