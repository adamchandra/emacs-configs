(message "loading adamchandra/funcs.el")

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
(defun delete-ansi-highlights (&optional start end)
  "Delete all the trailing whitespace across the current buffer.
   All whitespace after the last non-whitespace character in a line is deleted.
   This respects narrowing, created by \\[narrow-to-region] and friends.
   A formfeed is not considered whitespace by this function.
   If END is nil, also delete all trailing lines at the end of the buffer.
   If the region is active, only delete whitespace within the region."
  (interactive (progn
                 (barf-if-buffer-read-only)
                 (if (use-region-p)
                     (list (region-beginning) (region-end))
                   (list nil nil))))
  (save-match-data
    (save-excursion
      (let ((end-marker (copy-marker (or end (point-max))))
            (start (or start (point-min))))
        (goto-char start)
        (while (re-search-forward "\\[^m]+m" end-marker t)
          (delete-region (match-beginning 0) (match-end 0)))
        (set-marker end-marker nil))))

  (save-match-data
    (save-excursion
      (let ((end-marker (copy-marker (or end (point-max))))
            (start (or start (point-min))))
        (goto-char start)
        (while (re-search-forward "^\\[[^\]]+\\][ ]*" end-marker t)
          (delete-region (match-beginning 0) (match-end 0)))
        (set-marker end-marker nil))))
  nil)

 ;; functions for searching up and down directory paths
 (defun ensime-sbt-target-dir-p (path)
   "does this path have an sbt target dir?"
   (file-exists-p (concat path "/target" )))

 (defun ensime-sbt-at-root (path)
   "Determine if the given path is root."
   (equal path (ensime-sbt-parent-path path)))

 (defun ensime-sbt-parent-path (path)
   "The parent path for the given path."
   (file-truename (concat path "/..")))

(defun ensime-sbt-find-path-to-compile-target ()
   "Move up the directory tree for the current buffer
   until root or a directory with a project/build.properties
   is found."
   (interactive)
   (let ((fn (buffer-file-name)))
     (let ((path (file-name-directory fn)))
       (while (and (not (ensime-sbt-target-dir-p path))
                   (not (ensime-sbt-at-root path)))
         (setf path (file-truename (ensime-sbt-parent-path path))))
       (message path)
       path
       )))

;; (defun ensime-sbt-find-path-to-parent-project ()
;;   "Search up the directory tree find an SBT project
;;   dir, then see if it has a parent above it."
;;   (interactive)
;;   (let ((path (ensime-sbt-find-path-to-project)))
;;     (let ((parent-path (file-truename (concat path "/.."))))
;;       (if (not (ensime-sbt-project-dir-p parent-path))
;;           path
;;         parent-path))))
;;
(defun ensime-compile-errors ()
  (interactive)
  (let ( (filename (concat (ensime-sbt-find-path-to-compile-target) "/target/streams/compile/compile/\$global/streams/out"))
         (visit t)
         (beg nil) (end nil)
         (replace t))
    (message filename)
    (if (get-buffer "*ensime-compile-output*")
        (kill-buffer "*ensime-compile-output*"))
j    (switch-to-buffer (get-buffer-create "*ensime-compile-output*"))
    (fundamental-mode)
    (insert-file-contents filename visit beg end replace)
    (set-visited-file-name nil)
    (delete-ansi-highlights)
    (grep-mode)))

;; Commit hook for org-mode autosave (org mode indent view doesn't play well with git gutter/fringe mode)
(defun commit-after-save ()
  (interactive)
  (shell-command commit-script)
  (git-gutter+-mode -1)
  )

(defun find-my-init-files ()
  "find the directory containing private init files"
  (interactive)
  (find-file-existing adamchandra-layer-path))
;;; Ensime

(defun scala/configure-ensime ()
  "Ensure the file exists before starting `ensime-mode'."
  (if (file-exists-p (buffer-file-name))
      (ensime-mode +1)
    (add-hook 'after-save-hook (lambda () (ensime-mode +1)) nil t)))

(defun spacemacs/ensime-refactor-accept ()
  (interactive)
  (funcall continue-refactor)
  (ensime-popup-buffer-quit-function))

(defun spacemacs/ensime-refactor-cancel ()
  (interactive)
  (funcall cancel-refactor)
  (ensime-popup-buffer-quit-function))

;;; Interactive commands

(defun spacemacs/scala-join-line ()
  "Adapt `scala-indent:join-line' to behave more like evil's line join.

`scala-indent:join-line' acts like the vanilla `join-line',
joining the current line with the previous one. The vimmy way is
to join the current line with the next.

Try to move to the subsequent line and then join. Then manually move
point to the position of the join."
  (interactive)
  (let (join-pos)
    (save-excursion
      (goto-char (line-end-position))
      (unless (eobp)
        (forward-line)
        (call-interactively 'scala-indent:join-line)
        (setq join-pos (point))))

    (when join-pos
      (goto-char join-pos))))

(defun scala/completing-dot ()
  "Insert a period and show company completions."
  (interactive "*")
  (when (s-matches? (rx (+ (not space)))
                    (buffer-substring (line-beginning-position) (point)))
    (delete-horizontal-space t))
  (insert ".")
  (company-complete))

;;; Flyspell

(defun scala/flyspell-verify ()
  "Prevent common flyspell false positives in scala-mode."
  (and (flyspell-generic-progmode-verify)
       (not (s-matches? (rx bol (* space) "package") (current-line)))))

(defun scala/configure-flyspell ()
  (setq-local flyspell-generic-check-word-predicate 'scala/flyspell-verify))
