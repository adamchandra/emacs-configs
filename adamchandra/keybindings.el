

(evil-leader/set-key
  "hc" 'evil-search-highlight-persist-remove-all
  "fea" 'find-my-init-files
  "wr" 'rotate-windows
  )

(global-set-key (kbd "C-\\") 'winner-undo)

(defun turn-off-slow-stuff ()
  (interactive)
  (ensime-mode -1)
  (auto-complete-mode -1)
  (turn-off-smartparens-mode)
  )
(global-set-key (kbd "<f9>") 'turn-off-slow-stuff)
;; (global-unset-key "\\")





;; (setq-default evil-escape-key-sequence " k")
