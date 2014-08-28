;; (require 'moz)
;;
;; (defun find-sbt-project-dir (file-name)
;;   (interactive)
;;   (let* ((dir (file-name-directory file-name))
;;          (possible-path (concat dir "project/")))
;;     (if (file-directory-p dir)
;;         (if (file-exists-p possible-path)
;;             possible-path
;;           (if (not (equal dir (directory-file-name dir)))
;;               (find-sbt-project-dir (directory-file-name dir)))))))
;;
;; (defun sxr-sync-to-firefox()
;;   (interactive)
;;   (let* ((project-dir (find-sbt-project-dir buffer-file-name))
;;          (build-props (concat project-dir "build.properties"))
;;          (scala-version (get-property "build.scala.versions" build-props))
;;          (target-dir (concat project-dir "../target/scala_" scala-version "/"))
;;          (sxr-dir (concat target-dir "classes.sxr/")))
;;     (sxr-get-or-create-window)
;;     (mozrepl-eval
;;      (format "repl.sxr.location.href = 'file://%s/%s'"
;;              sxr-dir
;;              (sxr-buffer-name-to-html-path buffer-file-name)))))
;;
;; ;; not working yet
;; (defun sxr-sync-from-firefox()
;;   (interactive)
;;   (let* ((project-dir (find-sbt-project-dir buffer-file-name))
;;          (build-props (concat project-dir "build.properties"))
;;          (scala-version (get-property "build.scala.versions" build-props))
;;          (target-dir (concat project-dir "../target/scala_" scala-version "/"))
;;          (sxr-dir (concat target-dir "classes.sxr/")))
;;     (sxr-get-or-create-window)
;;     (mozrepl-eval
;;      (format "repl.sxr.location.href"))))
;;
;; ;; (comint-send-string (inferior-moz-process) "repl.sxr.location.href;")
;;
;; (defun sxr-buffer-name-to-html-path (buffer-name)
;;   (interactive)
;;   (concat
;;    (substring buffer-name
;;               (+ (length "/src/main/scala/")
;;                  (string-match "/src/main/scala/" buffer-name)))
;;    ".html"))
;;
;;
;; (defun mozrepl-eval (&rest jss)
;;   (interactive)
;;   (dolist (js jss)
;;     (comint-send-string (inferior-moz-process)
;;                         (concat js ";"))))
;;
;; (defun sxr-get-or-create-window ()
;;   (interactive)
;;   (mozrepl-eval
;;    "repl.home()"
;;    "if (!repl.sxr) { repl.sxr = window.open('', 'Scala EmaX-Ray') }"
;;   ))
;;
;; (defun read-property-file (file)
;;   (delq nil (mapcar 'split-on-eq
;;                     (read-lines file))))
;;
;; (defun get-property (property-name file)
;;   (second (assoc property-name
;;                  (read-property-file file))))
;;
;; (defun split-on-eq (str)
;;   (cond ((not (string-match-p "#" str))
;;          (split-string str "=" t))
;;         (t nil)))
;;
;; (defun read-lines (file)
;;   "Return a list of lines of a file at fpath."
;;   (with-temp-buffer
;;     (insert-file-contents file)
;;     (split-string (buffer-string) "\n" t)))


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
    (switch-to-buffer (get-buffer-create "*ensime-compile-output*"))
    (fundamental-mode)
    (insert-file-contents filename visit beg end replace)
    (set-visited-file-name nil)
    (delete-ansi-highlights)
    (grep-mode)))
