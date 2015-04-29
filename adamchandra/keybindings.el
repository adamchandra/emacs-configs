


(evil-leader/set-key
  "hc" 'evil-search-highlight-persist-remove-all
  "fea" 'find-my-init-files
  "fet" 'find-my-theme-file
  "wr" 'rotate-windows
  )

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




