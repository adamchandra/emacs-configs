
(defun trans-fwd-word()
  (interactive)
  (progn
    (save-excursion
      (google-translate-at-point))
    (evil-forward-WORD-begin)
    )
  );

(evil-leader/set-key
  "xg>" 'trans-fwd-word
  )

(provide 'translate-funcs)


