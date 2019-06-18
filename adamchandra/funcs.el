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
;;target/streams/compile/compileIncremental/$global/streams/out
(defun ensime-compile-errors ()
  (interactive)
  (let ( (filename (concat (ensime-sbt-find-path-to-compile-target)
                           "/target/streams/compile/compileIncremental/\$global/streams/out"
                           ;; "/target/streams/compile/compile/\$global/streams/out"
                           ))
         (visit t)
         (beg nil) (end nil)
         (replace t))
    (message filename)
    (if (get-buffer "*ensime-compile-output*")
        (kill-buffer "*ensime-compile-output*"))
    (switch-to-buffer (get-buffer-create "*ensime-compile-output*"))
    (fundamental-mode)
    (insert-file-contents filename visit beg end replace)
    (set-visited-file-name nil)
    (delete-ansi-highlights)
    (grep-mode)))


(defun find-my-init-files ()
  (interactive)
  (find-file-existing *acs-layer-path* )
  )

(defun find-my-theme-file ()
  "find the directory containing private init files"
  (interactive)
  (progn
    (find-file-existing *theme-path* )
    ))

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

;; (defun scala/completing-dot ()
;;   "Insert a period and show company completions."
;;   (interactive "*")
;;   (when (s-matches? (rx (+ (not space)))
;;                     (buffer-substring (line-beginning-position) (point)))
;;     (delete-horizontal-space t))
;;   (insert ".")
;;   (company-complete))

;;; Flyspell

(defun scala/flyspell-verify ()
  "Prevent common flyspell false positives in scala-mode."
  (and (flyspell-generic-progmode-verify)
       (not (s-matches? (rx bol (* space) "package") (current-line)))))

(defun scala/configure-flyspell ()
  (setq-local flyspell-generic-check-word-predicate 'scala/flyspell-verify))


(defun sbt-import-tablify()
  (interactive)
  (let* (
         (region (buffer-substring (mark) (point)))
         (tablified (replace-regexp-in-string "\\(%%?\\)" "|\\1" region))
         (tab2 (replace-regexp-in-string "\\(^[ ]*\\)" "\\1|" tablified))
         ;; (aligned (org-table-align tab2))
         ;; (untablified (replace-regex "\(%%?\)" "\1|" aligned)))
         )
    (message "tab: %s" tab2)
    (insert tab2)
    ;; (replace buffer substr)
    )
  )


(defun capture (group)
  (format "\\(%s\\)" group))

(defun nocapture (group)
  (format "\\(?:%s\\)" group))

(defun aorb (a b)
  (format "%s\\|%s" a b))

(defun nota (a)
  (format "[^%s]" (nocapture a)))

(defun html-to-scalatags ()
  (interactive)
  (let* (
         (s-or-dquote  (nocapture (aorb "\"" "'")))
         (quoted-str  (format "%s%s*%s" s-or-dquote (nota s-or-dquote) s-or-dquote))
         (equals "\=")
         (dashed-word  "[a-z-]+")
         (attrib-key-val (format "%s%s%s" (capture dashed-word) equals (capture quoted-str)))
         (tag-open  "\<\\(\\w+\\)[ ]+")
         (tag-close  "\<\/\\(\\w+\\)\>"))


    (goto-char (point-min))
    (while (re-search-forward tag-open nil t)
      (replace-match "<.\\1("))

    ;; (message attrib-key-val)
    (goto-char (point-min))
    (while (re-search-forward attrib-key-val nil t)
      (replace-match "^.`\\1`:=\\2"))

    (goto-char (point-min))
    (while (re-search-forward tag-close nil t)
      (replace-match ")"))

    (goto-char (point-min))
    (while (re-search-forward "\>" nil t)
      (replace-match ")("))

    (goto-char (point-min))
    (while (re-search-forward " \\^" nil t)
      (replace-match ", ^"))

    ))


;; (while (re-search-forward "\\<NEXT(\\([^\)]+\\))" nil t)
;;   (replace-match "\\1->next")))

;; (defun align-for-generators ()
;;   (interactive)
;;   (align-regexp ())

;;   )

(defun sync-intellij ()
  (interactive)
  (let* ((idea (executable-find "idea"))
         (currfile (buffer-file-name)))
    (call-process idea nil 0 nil currfile))
  )

;; (call-process PROGRAM &optional INFILE DESTINATION DISPLAY &rest ARGS)
;; (call-process PROGRAM &optional currfile 0 nil &rest ARGS)

;; (defun copyit--get-mime-type (file-path-or-buffer)
;;   "Get MIME content type by `FILE-PATH-OR-BUFFER'."
;;   ;; require `file' command.
;;   (unless (executable-find "file")
;;     (error "`file' command not exists"))
;;   (with-temp-buffer
;;     (let ((buf (current-buffer)))
;;       (with-current-buffer (copyit--get-buffer file-path-or-buffer)
;;         (call-process-region (point-min) (point-max)
;;                              "file" nil buf nil "-b" "--mime-type" "--" "-"))
;;       (goto-char (point-min))
;;       (search-forward "\n")
;;       (replace-match  "")
;;       (buffer-substring-no-properties (point-min) (point-max)))))

(defun my-reverse-region (beg end)
  "Reverse characters between BEG and END."
  (interactive "r")
  (let ((region (buffer-substring beg end)))
    (delete-region beg end)
    (insert (nreverse region))))
