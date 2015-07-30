
;; clear key if already set
;; (evil-leader/set-key
;;   "(p" ()
;;   )


(evil-leader/set-key
  "hc" 'evil-search-highlight-persist-remove-all
  "fea" 'find-my-init-files
  "fet" 'find-my-theme-file
  "wr" 'rotate-windows
  "(pp" 'sp-push-hybrid-sexp
  "(kk" 'sp-kill-hybrid-sexp
  "(tt" 'sp-transpose-hybrid-sexp
  "(sx" 'sp-slurp-hybrid-sexp
  "(sl" 'sp-forward-slurp-sexp
  "(bl" 'sp-forward-barf-sexp
  "(sh" 'sp-backward-slurp-sexp
  "(bh" 'sp-backward-barf-sexp
  )


;;sp-forward-sexp
;;sp-backward-sexp
;;sp-down-sexp
;;sp-backward-down-sexp
;;sp-beginning-of-sexp
;;sp-end-of-sexp
;;sp-up-sexp
;;sp-backward-up-sexp
;;sp-next-sexp
;;sp-previous-sexp
;;sp-kill-sexp
;;sp-copy-sexp
;;sp-unwrap-sexp
;;sp-backward-unwrap-sexp
;;sp-forward-slurp-sexp
;;sp-forward-barf-sexp
;;sp-backward-slurp-sexp
;;sp-backward-barf-sexp
;;sp-splice-sexp
;;sp-splice-sexp-killing-forward
;;sp-splice-sexp-killing-backward
;;sp-splice-sexp-killing-around
;;sp-select-next-thing-exchange
;;sp-select-next-thing
;;sp-forward-symbol
;;sp-backward-symbol



(global-set-key (kbd "C-\\") 'winner-undo)
(global-set-key (kbd "C-<f12>") 'eval-buffer)

(defun turn-off-slow-stuff ()
  (interactive)
  (ensime-mode -1)
  (auto-complete-mode -1)
  (turn-off-smartparens-mode)
  )
;; (global-set-key (kbd "<f9>") 'turn-off-slow-stuff)
;; (global-unset-key "\\")



;; TODO arg re-configuring
;; // (vertical/horizonal)-ize arguments
;; // re-order lines
;; // reapply commas


(defun enhanced-save-buffer ()
  (interactive)
  (progn
    (message "running enhanced")
    (delete-trailing-whitespace)
    ;; (evil-indent )
    (save-buffer)))

(global-set-key (kbd "C-x C-s") 'enhanced-save-buffer)
