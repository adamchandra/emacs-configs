;; These are snippets taken from  http://doc.norang.ca/org-mode.html that I have used at times, but don't currently have active


;; mode-specific hooks
(add-hook 'org-mode-hook
          '(lambda ()
             (local-set-key [(meta ?.)] 'org-open-at-point)
             (local-set-key [(meta ?,)] 'org-mark-ring-goto)
             ;; (local-set-key [(meta up)] 'org-timestamp-up)
             ;; (local-set-key [(meta down)] 'org-timestamp-down)
             ;; (local-set-key [(meta shift up)] 'org-clock-timestamps-up)
             ;; (local-set-key [(meta shift down)] 'org-clock-timestamps-down)
             ))



;; 4.4 Agenda Setup

(setq org-agenda-file-regexp "\\`[^.].*agenda\\.org\\'")
(setq org-agenda-files (list *orgfile-dir*))

;;  __________________________________________________________________
;; |Key____|For____________________________________________|Used______|
;; |F12____|Agenda_(1_key_less_than_C-c_a)_________________|Very_Often|
;; |C-c_b__|Switch_to_org_file_____________________________|Very_Often|
;; |F11____|Goto_currently_clocked_item____________________|Very_Often|
;; |C-M-r__|Capture_a_task_________________________________|Very_Often|
;; |C-F11__|Clock_in_a_task_(show_menu_with_prefix)________|Often_____|
;; |f9_g___|Gnus_-_I_check_mail_regularly__________________|Often_____|
;; |f5_____|Show_todo_items_for_this_subtree_______________|Often_____|
;; |S-f5___|Widen__________________________________________|Often_____|
;; |f9_b___|Quick_access_to_bbdb_data______________________|Often_____|
;; |f9_c___|Calendar_access________________________________|Often_____|
;; |C-S-f12|Save_buffers_and_publish_current_project_______|Often_____|
;; |C-c_l__|Store_a_link_for_retrieval_with_C-c_C-l________|Often_____|
;; |f8_____|Go_to_next_org_file_in_org-agenda-files________|Sometimes_|
;; |f9_r___|Boxquote_selected_region_______________________|Sometimes_|
;; |f9_t___|Insert_inactive_timestamp______________________|Sometimes_|
;; |f9_v___|Toggle_visible_mode_(for_showing/editing_links)|Sometimes_|
;; |C-f9___|Previous_buffer________________________________|Sometimes_|
;; |C-f10__|Next_buffer____________________________________|Sometimes_|
;; |C-x_n_r|Narrow_to_region_______________________________|Sometimes_|
;; |f9_f___|Boxquote_insert_a_file_________________________|Sometimes_|
;; |f9_i___|Info_manual____________________________________|Sometimes_|
;; |f9_I___|Punch_Clock_In_________________________________|Sometimes_|
;; |f9_O___|Punch_Clock_Out________________________________|Sometimes_|
;; |f9_o___|Switch_to_org_scratch_buffer___________________|Sometimes_|
;; |f9_s___|Switch_to_scratch_buffer_______________________|Sometimes_|
;; |C-c_r__|Capture_a_task_(from_my_mobile_phone)__________|Rare______|
;; |f9_h___|Hide_other_tasks_______________________________|Rare______|
;; |f7_____|Toggle_line_truncation/wrap____________________|Rare______|
;; |f9_T___|Tabify_region__________________________________|Rare______|
;; |f9_U___|Untabify_region________________________________|Rare______|
;; |C-c_a__|Enter_Agenda_(minimal_emacs_testing)___________|Rare______|

;;   ;; Custom Key Bindings
                                        ;   (global-set-key (kbd "<f12>") 'org-agenda)
;;   (global-set-key (kbd "<f5>") 'bh/org-todo)
;;   (global-set-key (kbd "<S-f5>") 'bh/widen)
;;   (global-set-key (kbd "<f7>") 'bh/set-truncate-lines)
;;   (global-set-key (kbd "<f8>") 'org-cycle-agenda-files)

(defun org-keybindings ()
  (interactive)
  (progn
    (global-set-key (kbd "<f9> <f9>") 'bh/show-org-agenda)
    (global-set-key (kbd "<f9> b") 'bbdb)
    (global-set-key (kbd "<f9> c") 'calendar)
    (global-set-key (kbd "<f9> f") 'boxquote-insert-file)
    (global-set-key (kbd "<f9> g") 'gnus)
    (global-set-key (kbd "<f9> h") 'bh/hide-other)
    (global-set-key (kbd "<f9> n") 'org-narrow-to-subtree)
    (global-set-key (kbd "<f9> w") 'widen)
    (global-set-key (kbd "<f9> u") 'bh/narrow-up-one-level)

    (global-set-key (kbd "<f9> I") 'bh/punch-in)
    (global-set-key (kbd "<f9> O") 'bh/punch-out)

    (global-set-key (kbd "<f9> o") 'bh/make-org-scratch)

    (global-set-key (kbd "<f9> r") 'boxquote-region)
    (global-set-key (kbd "<f9> s") 'bh/switch-to-scratch)

    (global-set-key (kbd "<f9> t") 'bh/insert-inactive-timestamp)
    (global-set-key (kbd "<f9> T") 'tabify)
    (global-set-key (kbd "<f9> U") 'untabify)

    (global-set-key (kbd "<f9> v") 'visible-mode)
    (global-set-key (kbd "<f9> SPC") 'bh/clock-in-last-task)

    (global-set-key (kbd "C-<f9>") 'previous-buffer)
    (global-set-key (kbd "M-<f9>") 'org-toggle-inline-images)
    (global-set-key (kbd "C-x n r") 'narrow-to-region)
    ;;   (global-set-key (kbd "C-<f10>") 'next-buffer)
    ;; (global-set-key (kbd "<f11>") 'org-clock-goto)
    ;; (global-set-key (kbd "C-<f11>") 'org-clock-in)
    ;;   (global-set-key (kbd "C-s-<f12>") 'bh/save-then-publish)
    (global-set-key (kbd "C-M-r") 'org-capture)
    (global-set-key (kbd "C-c r") 'org-capture)

    ;; I use C-M-r to start capture mode
    (global-set-key (kbd "C-M-r") 'org-capture)
    )
  )

(defun bh/hide-other ()
  (interactive)
  (save-excursion
    (org-back-to-heading 'invisible-ok)
    (hide-other)
    (org-cycle)
    (org-cycle)
    (org-cycle)))

(defun bh/set-truncate-lines ()
  "Toggle value of truncate-lines and refresh window display."
  (interactive)
  (setq truncate-lines (not truncate-lines))
  ;; now refresh window display (an idiom from simple.el):
  (save-excursion
    (set-window-start (selected-window)
                      (window-start (selected-window)))))

(defun bh/make-org-scratch ()
  (interactive)
  (find-file "/tmp/publish/scratch.org")
  (gnus-make-directory "/tmp/publish"))

(defun bh/switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))




;; 5.3 TODO state triggers

;; * Moving a task to CANCELLED adds a CANCELLED tag
;; * Moving a task to WAITING adds a WAITING tag
;; * Moving a task to HOLD adds a WAITING tag
;; * Moving a task to a done state removes a WAITING tag
;; * Moving a task to TODO removes WAITING and CANCELLED tags
;; * Moving a task to NEXT removes a WAITING tag
;; * Moving a task to DONE removes WAITING and CANCELLED tags

;; The tags are used to filter tasks in the agenda views conveniently.
(defun org-config-trigger-states()
  (interactive)
  (progn
    (setq org-treat-S-cursor-todo-selection-as-state-change nil)
    (setq org-todo-state-tags-triggers
          (quote (("CANCELLED" ("CANCELLED" . t))
                  ("WAITING" ("WAITING" . t))
                  ("HOLD" ("WAITING" . t) ("HOLD" . t))
                  (done ("WAITING") ("HOLD"))
                  ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

    ))


;; 6 Adding New Tasks Quickly with Org Capture

;; Org Capture mode replaces remember mode for capturing tasks and notes.
;;
;; To add new tasks efficiently I use a minimal number of capture templates. I
;;   used to have lots of capture templates, one for each org-file. I'd start
;;   org-capture with C-M-r and then pick a template that filed the task under *
;;   Tasks in the appropriate file. This binding of C-M-r overrides the default
;;   emacs reverse regexp search but I rarely use that and can invoke it from the
;;   M-x command line if I
;; really need it. I like C-M-r better than C-c r since it feels like a single
;;  keystroke instead of two separate keys and I've been using this so long that
;;  my fingers just do the right thing without really thinking about it.
;;
;;   I found I still needed to refile these capture tasks again to the correct
;;   location within the org-file so all of these different capture templates
;;   weren't really helping at all. Since then I've changed my workflow to use a
;;   minimal number of capture templates &#x2013; I create the new task quickly
;;   and refile it once. This also saves me from maintaining my org-capture
;;   templates when I add a new org file.

;; 6.1 Capture Templates

;; When a new task needs to be added I categorize it into one of a few things:

;; * A phone call (p)
;; * An email I need to respond to (r)
;; * A new task (t)
;; * A new note (n)
;; * An interruption (j)
;; * A new habit (h)

;; and pick the appropriate capture task.
;; Here is my setup for org-capture



;; I use C-c r to start capture mode when using SSH from my Android phone
;; (global-set-key (kbd "C-c r") 'org-capture)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file org-default-notes-file)
               "* TODO %?\n%U\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file org-default-notes-file)
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file org-default-notes-file)
               "* %? :NOTE:\n%U\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree org-journal-file)
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file org-default-notes-file)
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("p" "Phone call" entry (file org-default-notes-file)
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file org-default-notes-file)
               "* NEXT %?\n%U\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))





;; Capture mode now handles automatically clocking in and out of a capture task. This all works out of the box now without special hooks. When I start a capture mode task the task is clocked in as specified by :clock-in t and when the task is filed with C-c C-c the clock resumes on the original clocking task.
;; The quick clocking in and out of capture mode tasks (often it takes less than a minute to capture some new task details) can leave empty clock drawers in my tasks which aren't really useful. Since I remove clocking lines with 0:00 length I end up with a clock drawer like this:

;;     * TODO New Capture Task
;;       LOGBOOK:
;;       END:
;;       [2010-05-08 Sat 13:53]

;; I have the following setup to remove these empty LOGBOOK drawers if they occur.

;; Remove empty LOGBOOK drawers on clock out
(defun bh/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

(add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)



;; 7.1 Refile Setup

;; To refile tasks in org you need to tell it where you want to refile things.
;; In my setup I let any file in org-agenda-files and the current file contribute to the list of valid refile targets.
;; I've recently moved to using IDO to complete targets directly. I find this to be faster than my previous complete in steps setup. At first I didn't like IDO but after reviewing the documentation again and learning about C-SPC to limit target searches I find it is much better than my previous complete-in-steps setup. Now when I want to refile something I do C-c C-w to start the refile process, then
;; type something to get some matching targets, then C-SPC to restrict the matches to the current list, then continue searching with some other text to find the target I need. C-j also selects the current completion as the final target. I like this a lot. I show full outline paths in the targets so I can have the same heading in multiple subtrees or projects and still tell them apart while refiling.
;; I now exclude DONE state tasks as valid refile targets. This helps to keep the refile target list to a reasonable size.
;; Here is my refile configuration:

                                        ; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

                                        ; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

                                        ; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

                                        ; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

                                        ; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
                                        ; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)

     ;;;; Refile settings
                                        ; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)

;; To refile a task to my norang.org file under System Maintenance I just put the cursor on the task and hit C-c C-w and enter nor C-SPC sys RET and it's done. IDO completion makes locating targets a snap.

;; 7.2 Refiling Tasks
;; 7.3 Refiling Notes
;; 7.4 Refiling Phone Calls
;; 8 Custom agenda views
;; 8.1 Setup

;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("h" "Habits" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Stuck Projects")
                            (org-agenda-skip-function 'bh/skip-non-stuck-projects)))
                (tags-todo "-WAITING-CANCELLED/!NEXT"
                           ((org-agenda-overriding-header "Next Tasks")
                            (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                            (org-agenda-todo-ignore-scheduled t)
                            (org-agenda-todo-ignore-deadlines t)
                            (org-agenda-todo-ignore-with-date t)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
                (tags-todo "-REFILE-CANCELLED/!-HOLD-WAITING"
                           ((org-agenda-overriding-header "Tasks")
                            (org-agenda-skip-function 'bh/skip-project-tasks-maybe)
                            (org-agenda-todo-ignore-scheduled t)
                            (org-agenda-todo-ignore-deadlines t)
                            (org-agenda-todo-ignore-with-date t)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-HOLD-CANCELLED/!"
                           ((org-agenda-overriding-header "Projects")
                            (org-agenda-skip-function 'bh/skip-non-projects)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED+WAITING/!"
                           ((org-agenda-overriding-header "Waiting and Postponed Tasks")
                            (org-agenda-skip-function 'bh/skip-stuck-projects)
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled 'future)
                            (org-agenda-todo-ignore-deadlines 'future)))
                (tags "-REFILE/"
                      ((org-agenda-overriding-header "Tasks to Archive")
                       (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                       (org-tags-match-list-sublevels nil))))
               nil)
              ("r" "Tasks to Refile" tags "REFILE"
               ((org-agenda-overriding-header "Tasks to Refile")
                (org-tags-match-list-sublevels nil)))
              ("#" "Stuck Projects" tags-todo "-CANCELLED/!"
               ((org-agenda-overriding-header "Stuck Projects")
                (org-agenda-skip-function 'bh/skip-non-stuck-projects)))
              ("n" "Next Tasks" tags-todo "-WAITING-CANCELLED/!NEXT"
               ((org-agenda-overriding-header "Next Tasks")
                (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                (org-agenda-todo-ignore-scheduled t)
                (org-agenda-todo-ignore-deadlines t)
                (org-agenda-todo-ignore-with-date t)
                (org-tags-match-list-sublevels t)
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              ("R" "Tasks" tags-todo "-REFILE-CANCELLED/!-HOLD-WAITING"
               ((org-agenda-overriding-header "Tasks")
                (org-agenda-skip-function 'bh/skip-project-tasks-maybe)
                (org-agenda-sorting-strategy
                 '(category-keep))))
              ("p" "Projects" tags-todo "-HOLD-CANCELLED/!"
               ((org-agenda-overriding-header "Projects")
                (org-agenda-skip-function 'bh/skip-non-projects)
                (org-agenda-sorting-strategy
                 '(category-keep))))
              ("w" "Waiting Tasks" tags-todo "-CANCELLED+WAITING/!"
               ((org-agenda-overriding-header "Waiting and Postponed tasks"))
               (org-tags-match-list-sublevels nil))
              ("A" "Tasks to Archive" tags "-REFILE/"
               ((org-agenda-overriding-header "Tasks to Archive")
                (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                (org-tags-match-list-sublevels nil))))))




;; 8.4.1 Automatically removing context based tasks with / RET

;; / RET in the agenda is really useful. This awesome feature was added to org-mode by John
;; Wiegley. It removes tasks automatically by filtering based on a user-provided function.  At work
;; I have projects I'm working on which are assigned by my manager. Sometimes priorities changes and
;; projects are delayed to sometime in the future. This means I need to stop working on these
;; immediately. I put the project task on HOLD and work on something else. The / RET filter removes
;; HOLD tasks and subtasks (because of tag inheritance).  At home I have some tasks tagged with farm
;; since these need to be performed when I am physically at our family farm. Since I am there
;; infrequently I have added farm to the list of auto-excluded tags on my system. I can always
;; explicitly filter to just farm tasks with / TAB farm RET when I am physically there.  I have the
;; following setup to allow / RET to filter tasks based on the description above.

;; TODO: look into this a bit more
(defun bh/org-auto-exclude-function (tag)
  "Automatic task exclusion in the agenda with / RET"
  (and (cond
        ((string= tag "hold")
         t)
        ((string= tag "farm")
         t))
       (concat "-" tag)))

(setq org-agenda-auto-exclude-function 'bh/org-auto-exclude-function)

;; This lets me filter tasks with just / RET on the agenda which removes tasks I'm not supposed to be working on now from the list of returned results.
;; This helps to keep my agenda clutter-free.

;; 9 Time Clocking

;; 9.1 Clock Setup

;; To get started we need to punch in which clocks in the default task and keeps the clock running. This is now simply a matter of punching in the clock with F9 I. You can do this anywhere. Clocking out will now clock in the parent task (if there is one with a todo keyword) or clock in the default task if not parent exists.
;; Keeping the clock running when moving a subtask to a DONE state means clocking continues to apply to the project task. I can pick the next task from the parent and clock that in without losing a minute or two while I'm deciding what to work on next.
;; I keep clock times, state changes, and other notes in the :LOGBOOK: drawer.
;; I have the following org-mode settings for clocking:

;;
;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)
;;
;; Show lot sof clocking history so it's easy to pick items off the C-F11 list
(setq org-clock-history-length 36)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Change tasks to NEXT when clocking in
(setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")));;      (setq org-drawers (quote ("PROPERTIES" "CLOCK" "LOGBOOK" "HIDDEN" "MORE")))
;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)
;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

(setq bh/keep-clock-running nil)

(defun bh/clock-in-to-next (kw)
  "Switch a task from TODO to NEXT when clocking in.
     Skips capture tasks, projects, and subprojects.
     Switch projects and subprojects from NEXT back to TODO"
  (when (not (and (boundp 'org-capture-mode) org-capture-mode))
    (cond
     ((and (member (org-get-todo-state) (list "TODO"))
           (bh/is-task-p))
      "NEXT")
     ((and (member (org-get-todo-state) (list "NEXT"))
           (bh/is-project-p))
      "TODO"))))

(defun bh/find-project-task ()
  "Move point to the parent (project) task if any"
  (save-restriction
    (widen)
    (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
      (while (org-up-heading-safe)
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq parent-task (point))))
      (goto-char parent-task)
      parent-task)))

(defun bh/punch-in (arg)
  "Start continuous clocking and set the default task to the
     selected task.  If no task is selected set the Organization task
     as the default task."
  (interactive "p")
  (setq bh/keep-clock-running t)
  (if (equal major-mode 'org-agenda-mode)
      ;;
      ;; We're in the agenda
      ;;
      (let* ((marker (org-get-at-bol 'org-hd-marker))
             (tags (org-with-point-at marker (org-get-tags-at))))
        (if (and (eq arg 4) tags)
            (org-agenda-clock-in '(16))
          (bh/clock-in-organization-task-as-default)))
    ;;
    ;; We are not in the agenda
    ;;
    (save-restriction
      (widen)
                                        ; Find the tags on the current task
      (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
          (org-clock-in '(16))
        (bh/clock-in-organization-task-as-default)))))

(defun bh/punch-out ()
  (interactive)
  (setq bh/keep-clock-running nil)
  (when (org-clock-is-active)
    (org-clock-out))
  (org-agenda-remove-restriction-lock))

(defun bh/clock-in-default-task ()
  (save-excursion
    (org-with-point-at org-clock-default-task
      (org-clock-in))))

(defun bh/clock-in-parent-task ()
  "Move point to the parent (project) task if any and clock in"
  (let ((parent-task))
    (save-excursion
      (save-restriction
        (widen)
        (while (and (not parent-task) (org-up-heading-safe))
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq parent-task (point))))
        (if parent-task
            (org-with-point-at parent-task
              (org-clock-in))
          (when bh/keep-clock-running
            (bh/clock-in-default-task)))))))

(defvar bh/organization-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")

(defun bh/clock-in-organization-task-as-default ()
  (interactive)
  (org-with-point-at (org-id-find bh/organization-task-id 'marker)
    (org-clock-in '(16))))

(defun bh/clock-out-maybe ()
  (when (and bh/keep-clock-running
             (not org-clock-clocking-in)
             (marker-buffer org-clock-default-task)
             (not org-clock-resolving-clocks-due-to-idleness))
    (bh/clock-in-parent-task)))

(add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)

;; I used to clock in tasks by ID using the following function but with the new punch-in and punch-out I don't need these as much anymore. f9-SPC calls bh/clock-in-last-task which switches the clock back to the previously clocked task.

(require 'org-id)
(defun bh/clock-in-task-by-id (id)
  "Clock in a task by id"
  (org-with-point-at (org-id-find id 'marker)
    (org-clock-in nil)))

(defun bh/clock-in-last-task (arg)
  "Clock in the interrupted task if there is one
     Skip the default task and get the next one.
     A prefix arg forces clock in of the default task."
  (interactive "p")
  (let ((clock-in-to-task
         (cond
          ((eq arg 4) org-clock-default-task)
          ((and (org-clock-is-active)
                (equal org-clock-default-task (cadr org-clock-history)))
           (caddr org-clock-history))
          ((org-clock-is-active) (cadr org-clock-history))
          ((equal org-clock-default-task (car org-clock-history)) (cadr org-clock-history))
          (t (car org-clock-history)))))
    (widen)
    (org-with-point-at clock-in-to-task
      (org-clock-in nil))))


;; 9.2 Clocking in

;; 9.2.1 Setting a default clock task
;; 9.2.2 Using the clock history to clock in old tasks
;; 9.3 Clock Everything - Create New Tasks
;; 9.4 Finding tasks to clock in

;; 9.5 Editing clock entries

;; Sometimes it is necessary to edit clock entries so they reflect reality. I find I do this for maybe 2-3 entries in a week.
;; Occassionally I cannot clock in a task on time because I'm away from my computer. In this case the previous clocked task is still running and counts time for both tasks which is wrong.
;; I make a note of the time and then when I get back to my computer I clock in the right task and edit the start and end times to correct the clock history.
;; To visit the clock line for an entry quickly use the agenda log mode. F12 a l shows all clock lines for today. I use this to navigate to the appropriate clock lines quickly. F11 goes to the current clocked task but the agenda log mode is better for finding and visiting older clock entries.
;; Use F12 a l to open the agenda in log mode and show only logged clock times. Move the cursor down to the clock line you need to edit and hit TAB and you're there.
;; To edit a clock entry just put the cursor on the part of the date you want to edit (use the keyboard not the mouse - since the clicking on the timestamp with the mouse goes back to the agenda for that day) and hit the S-<up arrow> or S-<down arrow> keys to change the time.
;; The following setting makes time editing use discrete minute intervals (no rounding) increments:

(setq org-time-stamp-rounding-minutes (quote (1 1)))

;; Editing the time with the shift arrow combination also updates the total for the clock line which is a nice convenience.
;; I always check that I haven't created task overlaps when fixing time clock entries by viewing them with log mode on in the agenda. There is a new view in the agenda for this &#x2013; just hit v c in the daily agenda and clock gaps and overlaps are identified.
;; I want my clock entries to be as accurate as possible.
;; The following setting shows 1 minute clocking gaps.

(setq org-agenda-clock-consistency-checks
      (quote (:max-duration "4:00"
                            :min-duration 0
                            :max-gap 0
                            :gap-ok-around ("4:00"))))


;; 10 Time reporting and tracking


;; 10.1 Billing clients based on clocked time

;; 10.1.1 Verify that the clock data is complete and correct
;; Since I change tasks often (sometimes more than once in a minute) I use the following setting to remove clock entries with a zero duration.

;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; This setting just keeps my clocked log entries clean - only keeping clock entries that contribute to the clock report.
;; Before invoicing for clocked time it is important to make sure your clocked time data is correct. If you have a clocked time with an entry that is not closed (ie. it has no end time) then that is a hole in your clocked day and it gets counted as zero (0) for time spent on the task when generating clock reports. Counting it as zero is almost certainly wrong.
;; To check for unclosed clock times I use the agenda-view clock check (v c in the agenda). This view shows clocking gaps and overlaps in the agenda.
;; To check the last month's clock data I use F12 a v m b v c which shows a full month in the agenda, moves to the previous month, and shows the clocked times only. It's important to remove any agenda restriction locks and filters when checking the logs for gaps and overlaps.
;; The clocked-time only display in the agenda makes it easy to quickly scan down the list to see if an entry is missing an end time. If an entry is not closed you can manually fix the clock entry based on other clock info around that time.

;; 10.1.2 Using clock reports to summarize time spent

;; Billable time for clients are kept in separate org files.
;; To get a report of time spent on tasks for XYZ.org you simply visit the XYZ.org file and run an agenda clock report for the last month with F12 < a v m b R. This limits the agenda to this one file, shows the agenda for a full month, moves to last month, and generates a clock report.
;; My agenda org clock report settings show 5 levels of detail with links to the tasks. I like wider reports than the default compact setting so I override the :narrow value.

;; Agenda clock report parameters
(setq org-agenda-clockreport-parameter-plist
      (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))

;; I used to have a monthly clock report dynamic block in each project org file and manually updated them at the end of my billing cycle. I used this as the basis for billing my clients for time spent on their projects. I found updating the dynamic blocks fairly tedious when you have more than a couple of files for the month.
;; I have since moved to using agenda clock reports shortly after that feature was added. I find this much more convenient. The data isn't normally for consumption by anyone else so the format of the agenda clock report format is great for my use-case.

;; 10.2 Task Estimates and column view
;; 10.2.1 Creating a task estimate with column mode
;; I use properties and column view to do project estimates.
;; I set up column view globally with the following headlines

                                        ; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

;; This makes column view show estimated task effort and clocked times side-by-side which is great for reviewing your project estimates.
;; A property called Effort records the estimated amount of time a given task will take to complete. The estimate times I use are one of:

;; * 10 minutes
;; * 30 minutes
;; * 1 hour
;; * 2 hours
;; * 3 hours
;; * 4 hours
;; * 5 hours
;; * 6 hours
;; * 7 hours
;; * 8 hours

;; These are stored for easy use in column mode in the global property Effort_ALL.

                                        ; global Effort estimate values
                                        ; global STYLE property values for completion
(setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                    ("STYLE_ALL" . "habit"))))

;; To create an estimate for a task or subtree start column mode with C-c C-x C-c and collapse the tree with c. This shows a table overlayed on top of the headlines with the task name, effort estimate, and clocked time in columns.
;; With the cursor in the Effort column for a task you can easily set the estimated effort value with the quick keys 1 through 9.
;; After setting the effort values exit column mode with q.

;; 10.2.2 Saving your estimate
;; 10.2.3 Reviewing your estimate

;; 10.3 Providing progress reports to others

;; When someone wants details of what I've done recently I simple generate a log report in the agenda with tasks I've completed and state changes combined with a clock report for the appropriate time period.
;; The following setting shows closed tasks and state changes in the agenda. Combined with the agenda clock report ('R') I can quickly generate all of the details required.

;; Agenda log mode items to display (closed and state changes by default)
(setq org-agenda-log-mode-items (quote (closed state)))

;; To generate the report I pull up the agenda for the appropriate time frame (today, yesterday, this week, or last week) and hit the key sequence l R to add the log report (without clocking data lines) and the agenda clock report at the end.
;; Then it's simply a matter of exporting the resulting agenda in some useful format to provide to other people. C-x C-w /tmp/agenda.html RET exports to HTML and C-x C-w /tmp/agenda.txt RET exports to plain text. Other formats are available but I use these two the most.
;; Combining this export with tag filters and C-u R can limit the report to exactly the tags that people are interested in.

;; 11 Tags

;; Tasks can have any number of arbitrary tags. Tags are used for:

;; * filtering todo lists and agenda views
;; * providing context for tasks
;; * tagging notes
;; * tagging phone calls
;; * tagging tasks to be refiled
;; * tagging tasks in a WAITING state because a parent task is WAITING
;; * tagging cancelled tasks because a parent task is CANCELLED
;; * preventing export of some subtrees when publishing

;; I use tags mostly for filtering in the agenda. This means you can find tasks with a specific tag easily across your large number of org-mode files.
;; Some tags are mutually exclusive. These are defined in a group so that only one of the tags can be applied to a task at a time (disregarding tag inheritance). I use these types for tags for applying context to a task. (Work tasks have an @office tag, and are done at the office, Farm tasks have an @farm tag and are done at the farm &#x2013; I can't change the oil on the tractor if I'm not at the
;; farm&#x2026; so I hide these and other tasks by filtering my agenda view to only @office tasks when I'm at the office.)
;; Tasks are grouped together in org-files and a #+FILETAGS: entry applies a tag to all tasks in the file. I use this to apply a tag to all tasks in the file. My norang.org file creates a NORANG file tag so I can filter tasks in the agenda in the norang.org file easily.

;; 11.1 Tags

;; Here are my tag definitions with associated keys for filtering in the agenda views.
;; The startgroup - endgroup (@XXX) tags are mutually exclusive - selecting one removes a similar tag already on the task. These are the context tags - you can't be in two places at once so if a task is marked with @farm and you add @office then the @farm tag is removed automagically.
;; The other tags PHONE .. FLAGGED are not mutually exclusive and multiple tags can appear on a single task. Some of those tags are created by todo state change triggers. The shortcut key is used to add or remove the tag using C-c C-q or to apply the task for filtering on the agenda.
;; I have both FARM and @farm tags. FARM is set by a FILETAGS entry and just gives me a way to
;; filter anything farm related. The @farm tag signifies that the task as to be done at the farm. If
;; I have to call someone about something that would have a FARM tag but I can do that at home on my
;; lunch break. I don't physically have to be at the farm to make the call.

       ; ; Tags with fast selection keys
       ; (setq org-tag-alist (quote ((:startgroup)
       ;                             ("@errand" . ?e)
       ;                             ("@office" . ?o)
       ;                             ("@home" . ?H)
       ;                             ("@farm" . ?f)
       ;                             (:endgroup)
       ;                             ("PHONE" . ?p)
       ;                             ("WAITING" . ?w)
       ;                             ("HOLD" . ?h)
       ;                             ("PERSONAL" . ?P)
       ;                             ("WORK" . ?W)
       ;                             ("FARM" . ?F)
       ;                             ("ORG" . ?O)
       ;                             ("NORANG" . ?N)
       ;                             ("crypt" . ?E)
       ;                             ("MARK" . ?M)
       ;                             ("NOTE" . ?n)
       ;                             ("CANCELLED" . ?c)
       ;                             ("FLAGGED" . ??))))
       ;
       ; ; Allow setting single tags without the menu
       ; (setq org-fast-tag-selection-single-key (quote expert))
       ;
       ; ; For tag searches ignore tasks with scheduled and deadline dates
       ; (setq org-agenda-tags-todo-honor-ignore-options t)





(setq org-agenda-span 'day)
(setq org-stuck-projects (quote ("" nil nil "")))


(defun bh/is-project-p ()
  "Any task with a todo keyword subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task has-subtask))))

(defun bh/is-project-subtree-p ()
  "Any task with a todo keyword that is in a project subtree.
     Callers of this function already widen the buffer view."
  (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
                              (point))))
    (save-excursion
      (bh/find-project-task)
      (if (equal (point) task)
          nil
        t))))

(defun bh/is-task-p ()
  "Any task with a todo keyword and no subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task (not has-subtask)))))

(defun bh/is-subproject-p ()
  "Any task which is a subtask of another project"
  (let ((is-subproject)
        (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
    (save-excursion
      (while (and (not is-subproject) (org-up-heading-safe))
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq is-subproject t))))
    (and is-a-task is-subproject)))

(defun bh/list-sublevels-for-projects-indented ()
  "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
       This is normally used by skipping functions where this variable is already local to the agenda."
       (if (marker-buffer org-agenda-restrict-begin)
           (setq org-tags-match-list-sublevels 'indented)
         (setq org-tags-match-list-sublevels nil))
       nil)

     (defun bh/list-sublevels-for-projects ()
       "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
       This is normally used by skipping functions where this variable is already local to the agenda."
       (if (marker-buffer org-agenda-restrict-begin)
           (setq org-tags-match-list-sublevels t)
         (setq org-tags-match-list-sublevels nil))
       nil)

     (defun bh/skip-stuck-projects ()
       "Skip trees that are not stuck projects"
       (save-restriction
         (widen)
         (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
           (if (bh/is-project-p)
               (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                      (has-next ))
                 (save-excursion
                   (forward-line 1)
                   (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                     (unless (member "WAITING" (org-get-tags-at))
                       (setq has-next t))))
                 (if has-next
                     nil
                   next-headline)) ; a stuck project, has subtasks but no next task
             nil))))

     (defun bh/skip-non-stuck-projects ()
       "Skip trees that are not stuck projects"
       (bh/list-sublevels-for-projects-indented)
       (save-restriction
         (widen)
         (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
           (if (bh/is-project-p)
               (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                      (has-next ))
                 (save-excursion
                   (forward-line 1)
                   (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                     (unless (member "WAITING" (org-get-tags-at))
                       (setq has-next t))))
                 (if has-next
                     next-headline
                   nil)) ; a stuck project, has subtasks but no next task
             next-headline))))

     (defun bh/skip-non-projects ()
       "Skip trees that are not projects"
       (bh/list-sublevels-for-projects-indented)
       (if (save-excursion (bh/skip-non-stuck-projects))
           (save-restriction
             (widen)
             (let ((subtree-end (save-excursion (org-end-of-subtree t))))
               (cond
                ((and (bh/is-project-p)
                      (marker-buffer org-agenda-restrict-begin))
                 nil)
                ((and (bh/is-project-p)
                      (not (marker-buffer org-agenda-restrict-begin))
                      (not (bh/is-project-subtree-p)))
                 nil)
                (t
                 subtree-end))))
         (save-excursion (org-end-of-subtree t))))

     (defun bh/skip-project-trees-and-habits ()
       "Skip trees that are projects"
       (save-restriction
         (widen)
         (let ((subtree-end (save-excursion (org-end-of-subtree t))))
           (cond
            ((bh/is-project-p)
             subtree-end)
            ((org-is-habit-p)
             subtree-end)
            (t
             nil)))))

     (defun bh/skip-projects-and-habits-and-single-tasks ()
       "Skip trees that are projects, tasks that are habits, single non-project tasks"
       (save-restriction
         (widen)
         (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
           (cond
            ((org-is-habit-p)
             next-headline)
            ((bh/is-project-p)
             next-headline)
            ((and (bh/is-task-p) (not (bh/is-project-subtree-p)))
             next-headline)
            (t
             nil)))))

     (defun bh/skip-project-tasks-maybe ()
       "Show tasks related to the current restriction.
     When restricted to a project, skip project and sub project tasks, habits, NEXT tasks, and loose tasks.
     When not restricted, skip project and sub-project tasks, habits, and project related tasks."
       (save-restriction
         (widen)
         (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                (next-headline (save-excursion (or (outline-next-heading) (point-max))))
                (limit-to-project (marker-buffer org-agenda-restrict-begin)))
           (cond
            ((bh/is-project-p)
             next-headline)
            ((org-is-habit-p)
             subtree-end)
            ((and (not limit-to-project)
                  (bh/is-project-subtree-p))
             subtree-end)
            ((and limit-to-project
                  (bh/is-project-subtree-p)
                  (member (org-get-todo-state) (list "NEXT")))
             subtree-end)
            (t
             nil)))))

     (defun bh/skip-projects-and-habits ()
       "Skip trees that are projects and tasks that are habits"
       (save-restriction
         (widen)
         (let ((subtree-end (save-excursion (org-end-of-subtree t))))
           (cond
            ((bh/is-project-p)
             subtree-end)
            ((org-is-habit-p)
             subtree-end)
            (t
             nil)))))

     (defun bh/skip-non-subprojects ()
       "Skip trees that are not projects"
       (let ((next-headline (save-excursion (outline-next-heading))))
         (if (bh/is-subproject-p)
             nil
           next-headline)))


;; 15 Archiving


;; 15.1 Archiving Subtrees

;; My archiving procedure has changed. I used to move entire subtrees to a separate archive file for the project. Task subtrees in FILE.org get archived to FILE.org_archive using the a y command in the agenda.
;; I still archive to the same archive file as before but now I archive any done state todo task that is old enough to archive. Tasks to archive are listed automatically at the end of my block agenda and these are guaranteed to be old enough that I've already billed any time associated with these tasks. This cleans up my project trees and removes the old tasks that are no longer interesting. The
;; archived tasks get extra property data created during the archive procedure so that it is possible to reconstruct exactly where the archived entry came from in the rare case where you want to unarchive something.
;; My archive files are huge but so far I haven't found a need to split them by year (or decade) :)
;; Archivable tasks show up in the last section of my block agenda when a new month starts. Any tasks that are done but have no timestamps this month or last month (ie. they are over 30 days old) are available to archive. Timestamps include closed dates, notes, clock data, etc - any active or inactive timestamp in the task.
;; Archiving is trivial. Just mark all of the entries in the block agenda using the m key and then archive them all to the appropriate place with B $. This normally takes less than 5 minutes once a month.

;; 15.2 Archive Setup

;; I not longer use an ARCHIVE property in my subtrees. Tasks can just archive normally to the Archived Tasks heading in the archive file.
;; The following setting ensures that task states are untouched when they are archived. This makes it possible to archive tasks that are not marked DONE. By default tasks are archived under the heading * Archived Tasks in the archive file.

     (setq org-archive-mark-done nil)
     (setq org-archive-location "%s_archive::* Archived Tasks")


     (defun bh/skip-non-archivable-tasks ()
       "Skip trees that are not available for archiving"
       (save-restriction
         (widen)
         (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
           ;; Consider only tasks with done todo headings as archivable candidates
           (if (member (org-get-todo-state) org-done-keywords)
               (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                      (daynr (string-to-int (format-time-string "%d" (current-time))))
                      (a-month-ago (* 60 60 24 (+ daynr 1)))
                      (last-month (format-time-string "%Y-%m-" (time-subtract (current-time) (seconds-to-time a-month-ago))))
                      (this-month (format-time-string "%Y-%m-" (current-time)))
                      (subtree-is-current (save-excursion
                                            (forward-line 1)
                                            (and (< (point) subtree-end)
                                                 (re-search-forward (concat last-month "\\|" this-month) subtree-end t)))))
                 (if subtree-is-current
                     next-headline ; Has a date in this month or last month, skip it
                   nil))  ; available to archive
             (or next-headline (point-max))))))


;; 15.3 Archive Tag - Hiding Information

;; The only time I set the ARCHIVE tag on a task is to prevent it from opening by default because it has tons of information I don't really need to look at on a regular basis. I can open the task with C-TAB if I need to see the gory details (like a huge table of data related to the task) but normally I don't need that information displayed.

;; 15.4 When to Archive

;; Archiving monthly works well for me. I keep completed tasks around for at least 30 days before
;; archiving them. This keeps current clocking information for the last 30 days out of the
;; archives. This keeps my files that contribute to the agenda fairly current (this month, and last
;; month, and anything that is unfinished). I only rarely visit tasks in the archive when I need to
;; pull up ancient history for something.  Archiving keeps my main working files clutter-free. If I
;; ever need the detail for the archived tasks they are available in the appropriate archive file.

;; 16 Publishing and Exporting

;; I don't do a lot of publishing for other people but I do keep a set of private client system documentation online. Most of this documentation is a collection of notes exported to HTML.
;; Everything at http://doc.norang.ca/ is generated by publishing org-files. This includes the index pages on this site.
;; Org-mode can export to a variety of publishing formats including (but not limited to)

;; * ASCII (plain text - but not the original org-mode file)
;; * HTML
;; * LaTeX
;; * Docbook which enables getting to lots of other formats like ODF, XML, etc
;; * PDF via LaTeX or Docbook
;; * iCal

;; I haven't begun the scratch the surface of what org-mode is capable of doing. My main use case for org-mode publishing is just to create HTML documents for viewing online conveniently. Someday I'll get time to try out the other formats when I need them for something.


;; 16.1 New Exporter Setup
;;
;; The new exporter created by Nicolas Goaziou was introduced in org 8.0.
;;
;; I have the following setup for the exporters I use.
;;
;; Alphabetical listing options need to be set before the exporters are loaded for filling to work correctly.
;;
    (setq org-alphabetical-lists t)

    ;; Explicitly load required exporters
    (require 'ox-html)
    (require 'ox-latex)
    (require 'ox-ascii)

;; 16.1 Org-babel Setup

;; Org-babel makes it easy to generate decent graphics using external packages like ditaa, graphviz, PlantUML, and others.
;; The setup is really easy. ditaa is provided with the org-mode source. You'll have to install the graphviz and PlantUML packages on your system.

(setq org-ditaa-jar-path "~/emacs/lib/ditaa0_9.jar")
;; (setq org-plantuml-jar-path "~/java/plantuml.jar")

(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)

;; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")

(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         (ditaa . t)
         (R . t)
         (python . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (sh . t)
         (ledger . t)
         (org . t)
         (plantuml . t)
         (latex . t))))

;; Do not prompt to confirm evaluation
;; This may be dangerous - make sure you understand the consequences
;; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

;; Use fundamental mode when editing plantuml blocks with C-c '
;; (add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

;; Now you just create a begin-src block for the appropriate tool, edit the text, and build the pictures with C-c C-c. After evaluating the block results are displayed. You can toggle display of inline images with C-c C-x C-v
;;  I disable startup with inline images because when I access my org-files from an SSH session
;;  without X this breaks (say from my Android phone) it fails when trying to display the images on
;;  a non-X session. It's much more important for me to be able to access my org files from my
;;  Android phone remotely than it is to see images on startup.

;; Don't enable this because it breaks access to emacs from my Android phone
;; (setq org-startup-with-inline-images t)


;; 16.2 Playing with ditaa

;; ditaa is a great tool for quickly generating graphics to convey ideas and ditaa is distributed with org-mode! All of the graphics in this document are automatically generated by org-mode using plain text source.
;; Artist mode makes it easy to create boxes and lines for ditaa graphics.
;; The source for a ditaa graphic looks like this in org-mode:
;;
;;     #+begin_src ditaa :file some_filename.png :cmdline -r -s 0.8
;;       <context of ditaa source goes here>
;;     #+end_src

;; Here's an example without the #+begin_src and #+end_src lines.
;;
;;     #+begin_src ditaa :file some_filename.png :cmdline -r -s 0.8
;;         +-----------+        +---------+
;;         |    PLC    |        |         |
;;         |  Network  +<------>+   PLC   +<---=---------+
;;         |    cRED   |        |  c707   |              |
;;         +-----------+        +----+----+              |
;;                                   ^                   |
;;                                   |                   |
;;                                   |  +----------------|-----------------+
;;                                   |  |                |                 |
;;                                   v  v                v                 v
;;           +----------+       +----+--+--+      +-------+---+      +-----+-----+       Windows clients
;;           |          |       |          |      |           |      |           |      +----+      +----+
;;           | Database +<----->+  Shared  +<---->+ Executive +<-=-->+ Operator  +<---->|cYEL| . . .|cYEL|
;;           |   c707   |       |  Memory  |      |   c707    |      | Server    |      |    |      |    |
;;           +--+----+--+       |{d} cGRE  |      +------+----+      |   c707    |      +----+      +----+
;;              ^    ^          +----------+             ^           +-------+---+
;;              |    |                                   |
;;              |    +--------=--------------------------+
;;              v
;;     +--------+--------+
;;     |                 |
;;     | Millwide System |            -------- Data ---------
;;     | cBLU            |            --=----- Signals ---=--
;;     +-----------------+
;;     #+end_src

;;  communication.png

;;??: ;; 16.3 Playing with graphviz

;;??: ;; Graphviz is another great tool for creating graphics in your documents.
;;??: ;; The source for a graphviz graphic looks like this in org-mode:
;;??: ;;
;;??: ;;     #+begin_src dot :file some_filename.png :cmdline -Kdot -Tpng
;;??: ;;       <context of graphviz source goes here>
;;??: ;;     #+end_src
;;??: ;;
;;??: ;;
;;??: ;;     digraph G {
;;??: ;;       size="8,6"
;;??: ;;       ratio=expand
;;??: ;;       edge [dir=both]
;;??: ;;       plcnet [shape=box, label="PLC Network"]
;;??: ;;       subgraph cluster_wrapline {
;;??: ;;         label="Wrapline Control System"
;;??: ;;         color=purple
;;??: ;;         subgraph {
;;??: ;;         rank=same
;;??: ;;         exec
;;??: ;;         sharedmem [style=filled, fillcolor=lightgrey, shape=box]
;;??: ;;         }
;;??: ;;         edge[style=dotted, dir=none]
;;??: ;;         exec -> opserver
;;??: ;;         exec -> db
;;??: ;;         plc -> exec
;;??: ;;         edge [style=line, dir=both]
;;??: ;;         exec -> sharedmem
;;??: ;;         sharedmem -> db
;;??: ;;         plc -> sharedmem
;;??: ;;         sharedmem -> opserver
;;??: ;;       }
;;??: ;;       plcnet -> plc [constraint=false]
;;??: ;;       millwide [shape=box, label="Millwide System"]
;;??: ;;       db -> millwide
;;??: ;;
;;??: ;;       subgraph cluster_opclients {
;;??: ;;         color=blue
;;??: ;;         label="Operator Clients"
;;??: ;;         rankdir=LR
;;??: ;;         labelloc=b
;;??: ;;         node[label=client]
;;??: ;;         opserver -> client1
;;??: ;;         opserver -> client2
;;??: ;;         opserver -> client3
;;??: ;;       }
;;??: ;;     }

;;??: ;;  gv01.png
;;??: ;; The -Kdot is optional (defaults to dot) but you can substitute other graphviz types instead here (ie. twopi, neato, circo, etc).

;;??: ;; 16.4 Playing with PlantUML

;;??: ;; I have just started using PlantUML which is built on top of Graphviz. I'm still experimenting with this but so far I like it a lot. The todo state change diagrams in this document are created with PlantUML.
;;??: ;; The source for a PlantUML graphic looks like this in org-mode:
;;??: ;;
;;??: ;;     #+begin_src plantuml :file somefile.png
;;??: ;;       <context of PlantUML source goes here>
;;??: ;;     #+end_src


;;??: ;; 16.4.1 Sequence Diagram
;;??: ;;
;;??: ;;
;;??: ;;     title Example Sequence Diagram
;;??: ;;     activate Client
;;??: ;;     Client -> Server: Session Initiation
;;??: ;;     note right: Client requests new session
;;??: ;;     activate Server
;;??: ;;     Client <-- Server: Authorization Request
;;??: ;;     note left: Server requires authentication
;;??: ;;     Client -> Server: Authorization Response
;;??: ;;     note right: Client provides authentication details
;;??: ;;     Server --> Client: Session Token
;;??: ;;     note left: Session established
;;??: ;;     deactivate Server
;;??: ;;     Client -> Client: Saves token
;;??: ;;     deactivate Client

;;??: ;;  sequence.png

;;??: ;; 16.4.2 Activity Diagram
;;??: ;;
;;??: ;;
;;??: ;;     title Example Activity Diagram
;;??: ;;     note right: Example Function
;;??: ;;     (*)--> "Step 1"
;;??: ;;     --> "Step 2"
;;??: ;;     -> "Step 3"
;;??: ;;     --> "Step 4"
;;??: ;;     --> === STARTLOOP ===
;;??: ;;     note top: For each element in the array
;;??: ;;     if "Are we done?" then
;;??: ;;       -> [no] "Do this"
;;??: ;;       -> "Do that"
;;??: ;;       note bottom: Important note\ngoes here
;;??: ;;       -up-> "Increment counters"
;;??: ;;       --> === STARTLOOP ===
;;??: ;;     else
;;??: ;;       --> [yes] === ENDLOOP ===
;;??: ;;     endif
;;??: ;;     --> "Last Step"
;;??: ;;     --> (*)

;;??: ;;  activity.png

;;??: ;; 16.4.3 Usecase Diagram
;;??: ;;
;;??: ;;
;;??: ;;     LabUser --> (Runs Simulation)
;;??: ;;     LabUser --> (Analyses Results)

;;??: ;;  usecase.png

;;??: ;; 16.4.4 Object Diagram
;;??: ;;
;;??: ;;
;;??: ;;     Object1 <|-- Object2
;;??: ;;     Object1: someVar
;;??: ;;     Object1: execute()
;;??: ;;     Object2: getState()
;;??: ;;     Object2: setState()
;;??: ;;     Object2: state

;;??: ;;  object.png

;;??: ;; 16.4.5 State Diagram
;;??: ;;
;;??: ;;
;;??: ;;     [*] --> Start
;;??: ;;     Start -> State2
;;??: ;;     State2 -> State3
;;??: ;;     note right of State3: Notes can be\nattached to states
;;??: ;;     State2 --> State4
;;??: ;;     State4 -> Finish
;;??: ;;     State3 --> Finish
;;??: ;;     Finish --> [*]

;;??: ;;  plantuml_example_states.png

;; 16.5 Publishing Single Files

;; Org-mode exports the current file to one of the standard formats by invoking an export
;; function. The standard key binding for this is C-c C-e followed by the key for the type of export
;; you want.
;; This works great for single files or parts of files &#x2013; if you narrow the buffer to only
;; part of the org-mode file then you only get the narrowed detail in the export.

;; 16.6 Publishing Projects

;; I mainly use publishing for publishing multiple files or projects. I don't want to remember where
;; the created export file needs to move to and org-mode projects are a great solution to this.  The
;; http://doc.norang.ca website (and a bunch of other files that are not publicly available) are all
;; created by editing org-mode files and publishing the project the file is contained in. This is
;; great for people like me who want to figure out the details once and forget about it. I love
;; stuff that Just Works(tm).

;; Here's my publishing setup:

     ; ; experimenting with docbook exports - not finished
     ; (setq org-export-docbook-xsl-fo-proc-command "fop %s %s")
     ; (setq org-export-docbook-xslt-proc-command "xsltproc --output %s /usr/share/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl %s")
     ; ;

      ; Inline images in HTML instead of producting links to the image
      (setq org-export-html-inline-images t)
      ; Do not use sub or superscripts - I currently don't need this functionality in my documents
      (setq org-export-with-sub-superscripts nil)
      ; Use org.css from the norang website for export document stylesheets
      (setq org-export-html-style-extra "<link rel=\"stylesheet\" href=\"http://doc.norang.ca/org.css\" type=\"text/css\" />")
      (setq org-export-html-style-include-default nil)
      ; Do not generate internal css formatting for HTML exports
      (setq org-export-htmlize-output-type (quote css))
      ; Export with LaTeX fragments
      (setq org-export-with-LaTeX-fragments t)
      ; Increase default number of headings to export
      (setq org-export-headline-levels 6)

      ; List of projects
      ; norang       - http://www.norang.ca/
      ; doc          - http://doc.norang.ca/
      ; org-mode-doc - http://doc.norang.ca/org-mode.html and associated files
      ; org          - miscellaneous todo lists for publishing
      (setq org-publish-project-alist
            (quote (("norang-org"
                     :base-directory "/home/saunders/projects/the-toolshed/emacsen/org-files/org-agenda"
                     ;; :publishing-directory "/ssh:www-data@www:~/www.norang.ca/htdocs"
                     :publishing-directory "/home/saunders/projects/the-toolshed/emacsen/org-files/html-output"
                     :recursive t
                     :table-of-contents t
                     :base-extension "org"
                     :publishing-function org-html-publish-to-html
                     :style-include-default nil
                     :section-numbers nil
                     :table-of-contents nil
                     ;; :style "<link rel=\"stylesheet\" href=\"norang.css\" type=\"text/css\" />"
                     :author-info nil
                     :creator-info nil)

                    ("norang"
                     :components ("norang-org"))
                    )))
;;                    ("norang-extra"
;;                     ;;:base-directory "~/git/www.norang.ca/"
;;                     :base-directory "/home/saunders/projects/the-toolshed/emacsen/org-files/org-agenda"
;;                     :publishing-directory "/home/saunders/projects/the-toolshed/emacsen/org-files/html-output"
;;                     :base-extension "css\\|pdf\\|png\\|jpg\\|gif"
;;                     :publishing-function org-publish-attachment
;;                     :recursive t
;;                     :author nil)

      ; I'm lazy and don't want to remember the name of the project to publish when I modify
      ; a file that is part of a project.  So this function saves the file, and publishes
      ; the project that includes this file
      ;
      ; It's bound to C-S-F12 so I just edit and hit C-S-F12 when I'm done and move on to the next thing
      (defun bh/save-then-publish ()
        (interactive)
        (save-buffer)
        (org-save-all-org-buffers)
        (org-publish-current-project))

      (global-set-key (kbd "C-<f12>") 'bh/save-then-publish)

;; The main projects are norang, doc, doc-private, org-mode-doc, and tmp. These projects publish directly to the webserver directory on a remote web server that serves the site. Publishing one of these projects exports all modified pages, generates images, and copies the resulting files to the webserver so that they are immediately available for viewing.
;; The http://doc.norang.ca/ site contains subdirectories with client and private documentation that are restricted by using Apache Basic authentication. I don't create links to these sites from the publicly viewable pages. http://doc.norang.ca/someclient/ would show the index for any org files under ~/git/doc.norang.ca/someclient/ if that is set up as a viewable website. I use most of the
;; information myself but give access to clients if they are interested in the information/notes that I keep about their systems.
;; This works great for me - I know where my notes are and I can access them from anywhere on the internet. I'm also free to share notes with other people by simply giving them the link to the appropriate site.
;; All I need to remember to do is edit the appropriate org file and publish it with C-S-F12 &#x2013; not exactly hard :)
;; Recently I added a temporary publishing site for testing exports and validation. This is the tmp site which takes files from /tmp/publish and exports those files to a website publishing directory. This makes it easy to try new throw-away things on a live server.

;;??: ;; 16.7 Miscellaneous Export Settings

;;??: ;; This is a collection of export and publishing related settings that I use.

;;??: ;; 16.7.1 Fontify Latex listings for source blocks

;;??: ;; For export to latex I use the following setting to get fontified listings from source blocks:

;;??:      (setq org-export-latex-listings t)


;;??: ;; 16.7.2 Export HTML without XML header

;;??: ;; I use the following setting to remove the xml header line for HTML exports. This xml line was confusing Open Office when opening the HTML to convert to ODT.

;;??:      (setq org-export-html-xml-declaration (quote (("html" . "")
;;??:                                                    ("was-html" . "<?xml version=\"1.0\" encoding=\"%s\"?>")
;;??:                                                    ("php" . "<?php echo \"<?xml version=\\\"1.0\\\" encoding=\\\"%s\\\" ?>\"; ?>"))))


;;??: ;; 16.7.3 Allow binding variables on export without confirmation

;;??: ;; The following setting allows #+BIND: variables to be set on export without confirmation. In rare situations where I want to override some org-mode variable for export this allows exporting the document without a prompt.

;;??:      (setq org-export-allow-BIND t)


;;??: ;; 17 Reminders

;;??: ;; I use appt for reminders. It's simple and unobtrusive &#x2013; putting pending appointments in the status bar and beeping as 12, 9, 6, 3, and 0 minutes before the appointment is due.
;;??: ;; Everytime the agenda is displayed (and that's lots for me) the appointment list is erased and rebuilt from the current agenda details for today. This means everytime I reschedule something, add or remove tasks that are time related the appointment list is automatically updated the next time I look at the agenda.

;;??: ;; 17.1 Reminder Setup


;;??:      ; Erase all reminders and rebuilt reminders for today from the agenda
;;??:      (defun bh/org-agenda-to-appt ()
;;??:        (interactive)
;;??:        (setq appt-time-msg-list nil)
;;??:        (org-agenda-to-appt))

;;??:      ; Rebuild the reminders everytime the agenda is displayed
;;??:      (add-hook 'org-finalize-agenda-hook 'bh/org-agenda-to-appt 'append)

;;??:      ; This is at the end of my .emacs - so appointments are set up when Emacs starts
;;??:      (bh/org-agenda-to-appt)

;;??:      ; Activate appointments so we get notifications
;;??:      (appt-activate t)

;;??:      ; If we leave Emacs running overnight - reset the appointments one minute after midnight
;;??:      (run-at-time "24:01" nil 'bh/org-agenda-to-appt)


;;??: ;; 18 Productivity Tools

;;??: ;; This section is a miscellaneous collection of Emacs customizations that I use with org-mode so that it Works-For-Me(tm).

;;??: ;; 18.1 Abbrev-mode and Skeletons

;;??: ;; I use skeletons with abbrev-mode to quickly add preconfigured blocks to my Emacs edit buffers.
;;??: ;; I have blocks for creating:

;;??: ;; * generic blocks in org-mode
;;??: ;; * plantuml blocks in org-mode
;;??: ;;
;;??: ;;     o plantuml activity diagram block in org-mode
;;??: ;;     o plantuml sequent diagram block in org-mode

;;??: ;; * graphviz dot blocks in org-mode
;;??: ;; * ditaa blocks in org-mode
;;??: ;; * elisp source blocks in org-mode

;;??: ;; I still use < e TAB and < s TAB for creating example blocks and simple shell script blocks that need no further parameters.
;;??: ;; Here's my current setup for org-mode related skeletons. Each one defines an abbrev-mode shortcut so I can type splantumlRET to create a Plantuml block. This prompts for the filename (without extension) for the generated image file.
;;??: ;; At work I add a :tangle header to the skeleton and explicitly include the @startuml and @enduml marker lines in the skeleton so I can tangle the source file and share it with my colleagues. This makes the tangled source useable in Notepad and the PlantUML jar file running standalone.
;;??: ;; I have put the s (src) prefix on the shortcuts to prevent abbrev-mode from trying to expand PlantUML when I'm typing it in a sentence.
;;??: ;; For convenience in activity diagrams I added sif and sfor and just change the labels for the synchronization bars.

;;??:      ;; Enable abbrev-mode
;;??:      (add-hook 'org-mode-hook (lambda () (abbrev-mode 1)))

;;??:      ;; Skeletons
;;??:      ;;
;;??:      ;; sblk - Generic block #+begin_FOO .. #+end_FOO
;;??:      (define-skeleton skel-org-block
;;??:        "Insert an org block, querying for type."
;;??:        "Type: "
;;??:        "#+begin_" str "\n"
;;??:        _ - \n
;;??:        "#+end_" str "\n")

;;??:      (define-abbrev org-mode-abbrev-table "sblk" "" 'skel-org-block)

;;??:      ;; splantuml - PlantUML Source block
;;??:      (define-skeleton skel-org-block-plantuml
;;??:        "Insert a org plantuml block, querying for filename."
;;??:        "File (no extension): "
;;??:        "#+begin_src plantuml :file " str ".png :cache yes\n"
;;??:        _ - \n
;;??:        "#+end_src\n")

;;??:      (define-abbrev org-mode-abbrev-table "splantuml" "" 'skel-org-block-plantuml)

;;??:      (define-skeleton skel-org-block-plantuml-activity
;;??:        "Insert a org plantuml block, querying for filename."
;;??:        "File (no extension): "
;;??:        "#+begin_src plantuml :file " str "-act.png :cache yes :tangle " str "-act.txt\n"
;;??:        "@startuml\n"
;;??:        "skinparam activity {\n"
;;??:        "BackgroundColor<<New>> Cyan\n"
;;??:        "}\n\n"
;;??:        "title " str " - \n"
;;??:        "note left: " str "\n"
;;??:        "(*) --> (*)\n"
;;??:        _ - \n
;;??:        "@enduml\n"
;;??:        "#+end_src\n")

;;??:      (define-abbrev org-mode-abbrev-table "sact" "" 'skel-org-block-plantuml-activity)

;;??:      (define-skeleton skel-org-block-plantuml-activity-if
;;??:        "Insert a org plantuml block activity if statement"
;;??:        ""
;;??:        "if \"\" then\n"
;;??:        "  -> [] \"" - _ "\"\n"
;;??:        "  --> ==M1==\n"
;;??:        "  -left-> ==M2==\n"
;;??:        "else\n"
;;??:        "end if\n"
;;??:        "--> ==M2==")

;;??:      (define-abbrev org-mode-abbrev-table "sif" "" 'skel-org-block-plantuml-activity-if)

;;??:      (define-skeleton skel-org-block-plantuml-activity-for
;;??:        "Insert a org plantuml block activity for statement"
;;??:        ""
;;??:        "--> ==LOOP1==\n"
;;??:        "note left: Loop1: For each\n"
;;??:        "--> ==ENDLOOP1==\n"
;;??:        "note left: Loop1: End for each")

;;??:      (define-abbrev org-mode-abbrev-table "sfor" "" 'skel-org-block-plantuml-activity-for)

;;??:      (define-skeleton skel-org-block-plantuml-sequence
;;??:        "Insert a org plantuml activity diagram block, querying for filename."
;;??:        "File appends (no extension): "
;;??:        "#+begin_src plantuml :file " str "-seq.png :cache yes :tangle " str "-seq.txt\n"
;;??:        "@startuml\n"
;;??:        "title " str " - \n"
;;??:        "actor CSR as \"Customer Service Representative\"\n"
;;??:        "participant CSMO as \"CSM Online\"\n"
;;??:        "participant CSMU as \"CSM Unix\"\n"
;;??:        "participant NRIS\n"
;;??:        "actor Customer"
;;??:        _ - \n
;;??:        "@enduml\n"
;;??:        "#+end_src\n")

;;??:      (define-abbrev org-mode-abbrev-table "sseq" "" 'skel-org-block-plantuml-sequence)

;;??:      ;; sdot - Graphviz DOT block
;;??:      (define-skeleton skel-org-block-dot
;;??:        "Insert a org graphviz dot block, querying for filename."
;;??:        "File (no extension): "
;;??:        "#+begin_src dot :file " str ".png :cache yes :cmdline -Kdot -Tpng\n"
;;??:        "graph G {\n"
;;??:        _ - \n
;;??:        "}\n"
;;??:        "#+end_src\n")

;;??:      (define-abbrev org-mode-abbrev-table "sdot" "" 'skel-org-block-dot)

;;??:      ;; sditaa - Ditaa source block
;;??:      (define-skeleton skel-org-block-ditaa
;;??:        "Insert a org ditaa block, querying for filename."
;;??:        "File (no extension): "
;;??:        "#+begin_src ditaa :file " str ".png :cache yes\n"
;;??:        _ - \n
;;??:        "#+end_src\n")

;;??:      (define-abbrev org-mode-abbrev-table "sditaa" "" 'skel-org-block-ditaa)

;;??:      ;; selisp - Emacs Lisp source block
;;??:      (define-skeleton skel-org-block-elisp
;;??:        "Insert a org emacs-lisp block"
;;??:        ""
;;??:        "#+begin_src emacs-lisp\n"
;;??:        _ - \n
;;??:        "#+end_src\n")

;;??:      (define-abbrev org-mode-abbrev-table "selisp" "" 'skel-org-block-elisp)

;;??: ;; I also use abbrev-mode when taking notes at work. I tend to write first names for people which get expanded to their complete name in my notes. So if I write mickey it gets automatically expanded to Mickey Mouse as I type. To create an abbreviation just type in the short form followed by C-x a i l to create an abbreviation for the current mode I'm in.
;;??: ;; The only thing you have to be careful with is not to use a common word for your abbreviation since abbrev-mode will try to expand it everytime you enter it. I found this annoying when I used plantuml as one of my abbreviations.
;;??: ;; I also use skeletons and abbrev-mode for C source files at work. This works really well for me.

;; 18.2 Focus On Current Work
;; 18.2.1 Narrowing to a subtree with bh/org-todo
;; f5 and S-f5 are bound the functions for narrowing and widening the emacs buffer as defined below.
;; We now use:

;; * T (tasks) for C-c / t on the current buffer
;; * N (narrow) narrows to this task subtree
;; * U (up) narrows to the immediate parent task subtree without moving
;; * P (project) narrows to the parent project subtree without moving
;; * F (file) narrows to the current file or file of the existing restriction

;; The agenda keeps widening the org buffer so this gives a convenient way to focus on what we are doing.

     ;; (global-set-key (kbd "<f5>") 'bh/org-todo)

     (defun bh/org-todo (arg)
       (interactive "p")
       (if (equal arg 4)
           (save-restriction
             (bh/narrow-to-org-subtree)
             (org-show-todo-tree nil))
         (bh/narrow-to-org-subtree)
         (org-show-todo-tree nil)))

     ;; (global-set-key (kbd "<S-f5>") 'bh/widen)

     (defun bh/widen ()
       (interactive)
       (if (equal major-mode 'org-agenda-mode)
           (org-agenda-remove-restriction-lock)
         (widen)
         (org-agenda-remove-restriction-lock)))

     (add-hook 'org-agenda-mode-hook
               '(lambda () (org-defkey org-agenda-mode-map "W" 'bh/widen))
               'append)

     (defun bh/restrict-to-file-or-follow (arg)
       "Set agenda restriction to 'file or with argument invoke follow mode.
     I don't use follow mode very often but I restrict to file all the time
     so change the default 'F' binding in the agenda to allow both"
       (interactive "p")
       (if (equal arg 4)
           (org-agenda-follow-mode)
         (if (equal major-mode 'org-agenda-mode)
             (bh/set-agenda-restriction-lock 4)
           (widen))))

     (add-hook 'org-agenda-mode-hook
               '(lambda () (org-defkey org-agenda-mode-map "F" 'bh/restrict-to-file-or-follow))
               'append)

     (defun bh/narrow-to-org-subtree ()
       (widen)
       (org-narrow-to-subtree))

     (defun bh/narrow-to-subtree ()
       (interactive)
       (if (equal major-mode 'org-agenda-mode)
           (org-with-point-at (org-get-at-bol 'org-hd-marker)
             (bh/narrow-to-org-subtree)
             (save-restriction
               (org-agenda-set-restriction-lock)))
         (bh/narrow-to-org-subtree)
         (save-restriction
           (org-agenda-set-restriction-lock))))

     (add-hook 'org-agenda-mode-hook
               '(lambda () (org-defkey org-agenda-mode-map "N" 'bh/narrow-to-subtree))
               'append)

     (defun bh/narrow-up-one-org-level ()
       (widen)
       (save-excursion
         (outline-up-heading 1 'invisible-ok)
         (bh/narrow-to-org-subtree)))

     (defun bh/get-pom-from-agenda-restriction-or-point ()
       (or (org-get-at-bol 'org-hd-marker)
           (and (marker-position org-agenda-restrict-begin) org-agenda-restrict-begin)
           (and (equal major-mode 'org-mode) (point))
           org-clock-marker))

     (defun bh/narrow-up-one-level ()
       (interactive)
       (if (equal major-mode 'org-agenda-mode)
           (org-with-point-at (bh/get-pom-from-agenda-restriction-or-point)
             (bh/narrow-up-one-org-level))
         (bh/narrow-up-one-org-level)))

     (add-hook 'org-agenda-mode-hook
               '(lambda () (org-defkey org-agenda-mode-map "U" 'bh/narrow-up-one-level))
               'append)

     (defun bh/narrow-to-org-project ()
       (widen)
       (save-excursion
         (bh/find-project-task)
         (bh/narrow-to-org-subtree)))

     (defun bh/narrow-to-project ()
       (interactive)
       (if (equal major-mode 'org-agenda-mode)
           (org-with-point-at (bh/get-pom-from-agenda-restriction-or-point)
             (bh/narrow-to-org-project)
             (save-restriction
               (org-agenda-set-restriction-lock)))
         (bh/narrow-to-org-project)
         (save-restriction
           (org-agenda-set-restriction-lock))))

     (add-hook 'org-agenda-mode-hook
               '(lambda () (org-defkey org-agenda-mode-map "P" 'bh/narrow-to-project))
               'append)

     (defvar bh/current-view-project nil)

     (defun bh/view-next-project ()
       (interactive)
       (unless (marker-position org-agenda-restrict-begin)
         (goto-char (point-min))
         (setq bh/current-view-project (point)))
       (bh/widen)
       (goto-char bh/current-view-project)
       (forward-visible-line 1)
       (while (and (< (point) (point-max))
                   (or (not (org-get-at-bol 'org-hd-marker))
                       (org-with-point-at (org-get-at-bol 'org-hd-marker)
                         (or (not (bh/is-project-p))
                             (bh/is-project-subtree-p)))))
         (forward-visible-line 1))
       (setq bh/current-view-project (point))
       (if (org-get-at-bol 'org-hd-marker)
           (progn
             (bh/narrow-to-project)
             (org-agenda-redo)
             (beginning-of-buffer))
         (beginning-of-buffer)
         (error "All projects viewed.")))

     (add-hook 'org-agenda-mode-hook
               '(lambda () (org-defkey org-agenda-mode-map "V" 'bh/view-next-project))
               'append)

;; This makes it easy to hide all of the other details in your org-file temporarily by limiting your view to this task subtree. Tasks are folded and hilighted so that only tasks which are incomplete are shown.
;; I hit f5 (or the T speed key) a lot. This basically does a org-narrow-to-subtree and C-c / t combination leaving the buffer in a narrowed state. I use S-f5 (or some other widening speed key like U, W, F) to widen back to the normal view.
;; I also have the following setting to force showing the next headline.

     (setq org-show-entry-below (quote ((default))))

;; This prevents too many headlines from being folded together when I'm working with collapsed trees.

;; 18.2.2 Limiting the agenda to a subtree

;; C-c C-x < turns on the agenda restriction lock for the current subtree. This keeps your agenda
;; focused on only this subtree. Alarms and notifications are still active outside the agenda
;; restriction. C-c C-x > turns off the agenda restriction lock returning your agenda view back to
;; normal.
;; I have added key bindings for the agenda to allow using C-c C-x < in the agenda to set the restriction lock to the current task directly. The following elisp accomplishes this.

     (add-hook 'org-agenda-mode-hook
               '(lambda () (org-defkey org-agenda-mode-map "\C-c\C-x<" 'bh/set-agenda-restriction-lock))
               'append)

     (defun bh/set-agenda-restriction-lock (arg)
       "Set restriction lock to current task subtree or file if prefix is specified"
       (interactive "p")
       (let* ((pom (bh/get-pom-from-agenda-restriction-or-point))
              (tags (org-with-point-at pom (org-get-tags-at))))
         (let ((restriction-type (if (equal arg 4) 'file 'subtree)))
           (save-restriction
             (cond
              ((and (equal major-mode 'org-agenda-mode) pom)
               (org-with-point-at pom
                 (org-agenda-set-restriction-lock restriction-type)))
              ((and (equal major-mode 'org-mode) (org-before-first-heading-p))
               (org-agenda-set-restriction-lock 'file))
              (pom
               (org-with-point-at pom
                 (org-agenda-set-restriction-lock restriction-type))))))))

;; This allows me to set the restriction lock from agenda to task directly. I work from the agenda a lot and I find this very convenient.
;; Setting the restriction directly to the task is less surprising than automatically moving up the tree to the project level task &#x2013; which is what I was doing before. If the select task is too restrictive it's easy to move the restriction lock up a level by visiting the task in the org file and going up and resetting the lock - in case you want to see move of the project.
;; Selecting the entire project sometimes has too many tasks in it and I want to limit the view to part of the subtree. This is why I keep the N and U key bindings for adjusting the narrowed region.
;; I've added new convenience keys for restricting the agenda and org-buffer to subtree, parent task, and project task, as well as removing the restriction. These keys work both in the agenda and as speed commands on a headline in the o;;??:rg-file.

;; * N narrows to the current task subtree
;;     This is the same as same as C-c C-x <
;; * U narrows to the parent subtree of this task
;;     This goes up one level and narrows to that subtree.
;; * P narrows to the entire project containing this task
;;     This goes up the tree to the top-level TODO keyword and selects that as the subtree to narrow to
;; * W removes the restriction, widening the buffer


;;??: ;; 18.2.3 Limiting the agenda to a file

;;??: ;; You can limit the agenda view to a single file in multiple ways.
;;??: ;; You can use the agenda restriction lock C-c C-x < on the any line before the first heading to set the agenda restriction lock to this file only. This is equivalent using a prefix argumment (C-u C-c C-x <) anywhere in the file. This lock stays in effect until you remove it with C-c C-x >.
;;??: ;; This also works in the agenda with my C-u C-c c-x < key binding.
;;??: ;; Another way is to invoke the agenda with F12 < a while visiting an org-mode file. This limits the agenda view to just this file. I occasionally use this to view a file not in my org-agenda-files in the agenda.

;;??: ;; 18.3 Tuning the Agenda Views

;;??: ;; Various customizations affect how the agenda views show task details. This section shows each of the customizations I use in my workflow.

;; 18.3.1 Highlight the current agenda line

;; The following code in my .emacs file keeps the current agenda line highlighted. This makes it obvious what task will be affected by commands issued in the agenda. No more acting on the wrong task by mistake!
;; The clock modeline time is also shown with a reverse background.

     ;; Always hilight the current agenda line
     (add-hook 'org-agenda-mode-hook
               '(lambda () (hl-line-mode 1))
               'append)

     ;; TODO
     ;; ;; The following custom-set-faces create the highlights
     ;; (custom-set-faces
     ;;   ;; custom-set-faces was added by Custom.
     ;;   ;; If you edit it by hand, you could mess it up, so be careful.
     ;;   ;; Your init file should contain only one such instance.
     ;;   ;; If there is more than one, they won't work right.
     ;;  '(org-mode-line-clock ((t (:background "grey75" :foreground "red" :box (:line-width -1 :style released-button)))) t))


;; 18.3.2 Keep tasks with timestamps visible on the global todo lists

;; Tasks with dates (SCHEDULED:, DEADLINE:, or active dates) show up in the agenda when appropriate. The block agenda view (F12 a) tries to keep tasks showing up only in one location (either in the calendar or other todo lists in later sections of the block agenda.) I now rarely use the global todo list search in org-mode (F12 t, F12 m) and when I do I'm trying to find a specific task quickly. These
;; lists now include everything so I can just search for the item I want and move on.
;; The block agenda prevents display of tasks with deadlines or scheduled dates in the future so you can safely ignore these until the appropriate time.

     ;; Keep tasks with dates on the global todo lists
     (setq org-agenda-todo-ignore-with-date nil)

     ;; Keep tasks with deadlines on the global todo lists
     (setq org-agenda-todo-ignore-deadlines nil)

     ;; Keep tasks with scheduled dates on the global todo lists
     (setq org-agenda-todo-ignore-scheduled nil)

     ;; Keep tasks with timestamps on the global todo lists
     (setq org-agenda-todo-ignore-timestamp nil)

     ;; Remove completed deadline tasks from the agenda view
     (setq org-agenda-skip-deadline-if-done t)

     ;; Remove completed scheduled tasks from the agenda view
     (setq org-agenda-skip-scheduled-if-done t)

     ;; Remove completed items from search results
     (setq org-agenda-skip-timestamp-if-done t)


;; 18.3.3 Use the Diary for Holidays and Appointments

;; I don't use the emacs Diary for anything but I like seeing the holidays on my agenda. This helps with planning for those days when you're not supposed to be working.

     (setq org-agenda-include-diary nil)
     (setq org-agenda-diary-file org-journal-file)


;; The diary file keeps date-tree entries created by the capture mode 'appointment' template. I use this also for miscellaneous tasks I want to clock during interruptions.
;; I don't use a ~/diary file anymore. That is just there as a zero-length file to keep Emacs happy. I use org-mode's diary functions instead. Inserting entries with i in the emacs agenda creates date entries in the ~/git/org/diary.org file.
;; I include holidays from the calendar in my todo.org file as follows:
;;
;;      #+FILETAGS: PERSONAL
;;      * Appointments
;;        PROPERTIES:
;;        CATEGORY: Appt
;;        ARCHIVE:  %s_archive::* Appointments
;;        END:
;;      ** Holidays
;;         PROPERTIES:
;;         Category: Holiday
;;         END:
;;         %%(org-calendar-holiday)
;;      ** Some other Appointment
;;         ...

;; I use the following setting so any time strings in the heading are shown in the agenda.

     (setq org-agenda-insert-diary-extract-time t)

;; 18.3.4 Searches include archive files

;; I keep a single archive file for each of my org-mode project files. This allows me to search the current file and the archive when I need to dig up old information from the archives.
;; I don't need this often but it sure is handy on the occasions that I do need it.

     ; ;; Include agenda archive files when searching for things
     ; (setq org-agenda-text-search-extra-files (quote (agenda-archives)))


;; 18.3.5 Agenda view tweaks

;; The following agenda customizations control

;; * display of repeating tasks
;; * display of empty dates on the agenda
;; * task sort order
;; * start the agenda weekly view with Sunday
;; * display of the grid
;; * habits at the bottom

;; I use a custom sorting function so that my daily agenda lists tasks in order of importance. Tasks on the daily agenda are listed in the following order:
;;
;;      1. tasks with times at the top so they are hard to miss
;;      2. entries for today (active timestamp headlines that are not scheduled or deadline tasks)
;;      3. deadlines due today
;;      4. late deadline tasks
;;      5. scheduled items for today
;;      6. pending deadlines (due soon)
;;      7. late scheduled items
;;      8. habits

;; The lisp for this isn't particularly pretty but it works.
;; Here are the .emacs settings:

     ;; Show all future entries for repeating tasks
     (setq org-agenda-repeating-timestamp-show-all t)

     ;; Show all agenda dates - even if they are empty
     (setq org-agenda-show-all-dates t)

     ;; Sorting order for tasks on the agenda
     (setq org-agenda-sorting-strategy
           (quote ((agenda habit-down time-up user-defined-up priority-down effort-up category-keep)
                   (todo category-up priority-down effort-up)
                   (tags category-up priority-down effort-up)
                   (search category-up))))

     ;; Start the weekly agenda on Monday
     (setq org-agenda-start-on-weekday 1)

     ;; Enable display of the time grid so we can see the marker for the current time
     (setq org-agenda-time-grid (quote ((daily today remove-match)
                                        #("----------------" 0 16 (org-heading t))
                                        (0900 1100 1300 1500 1700))))

     ;; Display tags farther right
     (setq org-agenda-tags-column -102)

     ;;
     ;; Agenda sorting functions
     ;;
     (setq org-agenda-cmp-user-defined 'bh/agenda-sort)

     (defun bh/agenda-sort (a b)
       "Sorting strategy for agenda items.
     Late deadlines first, then scheduled, then non-late deadlines"
       (let (result num-a num-b)
         (cond
          ; time specific items are already sorted first by org-agenda-sorting-strategy

          ; non-deadline and non-scheduled items next
          ((bh/agenda-sort-test 'bh/is-not-scheduled-or-deadline a b))

          ; deadlines for today next
          ((bh/agenda-sort-test 'bh/is-due-deadline a b))

          ; late deadlines next
          ((bh/agenda-sort-test-num 'bh/is-late-deadline '< a b))

          ; scheduled items for today next
          ((bh/agenda-sort-test 'bh/is-scheduled-today a b))

          ; late scheduled items next
          ((bh/agenda-sort-test-num 'bh/is-scheduled-late '> a b))

          ; pending deadlines last
          ((bh/agenda-sort-test-num 'bh/is-pending-deadline '< a b))

          ; finally default to unsorted
          (t (setq result nil)))
         result))

     (defmacro bh/agenda-sort-test (fn a b)
       "Test for agenda sort"
       `(cond
         ; if both match leave them unsorted
         ((and (apply ,fn (list ,a))
               (apply ,fn (list ,b)))
          (setq result nil))
         ; if a matches put a first
         ((apply ,fn (list ,a))
          (setq result -1))
         ; otherwise if b matches put b first
         ((apply ,fn (list ,b))
          (setq result 1))
         ; if none match leave them unsorted
         (t nil)))

     (defmacro bh/agenda-sort-test-num (fn compfn a b)
       `(cond
         ((apply ,fn (list ,a))
          (setq num-a (string-to-number (match-string 1 ,a)))
          (if (apply ,fn (list ,b))
              (progn
                (setq num-b (string-to-number (match-string 1 ,b)))
                (setq result (if (apply ,compfn (list num-a num-b))
                                 -1
                               1)))
            (setq result -1)))
         ((apply ,fn (list ,b))
          (setq result 1))
         (t nil)))

     (defun bh/is-not-scheduled-or-deadline (date-str)
       (and (not (bh/is-deadline date-str))
            (not (bh/is-scheduled date-str))))

     (defun bh/is-due-deadline (date-str)
       (string-match "Deadline:" date-str))

     (defun bh/is-late-deadline (date-str)
       (string-match "In *\\(-.*\\)d\.:" date-str))

     (defun bh/is-pending-deadline (date-str)
       (string-match "In \\([^-]*\\)d\.:" date-str))

     (defun bh/is-deadline (date-str)
       (or (bh/is-due-deadline date-str)
           (bh/is-late-deadline date-str)
           (bh/is-pending-deadline date-str)))

     (defun bh/is-scheduled (date-str)
       (or (bh/is-scheduled-today date-str)
           (bh/is-scheduled-late date-str)))

     (defun bh/is-scheduled-today (date-str)
       (string-match "Scheduled:" date-str))

     (defun bh/is-scheduled-late (date-str)
       (string-match "Sched\.\\(.*\\)x:" date-str))


;; 18.3.6 q buries the agenda view buffer

;; I change the q key in the agenda so instead of killing the agenda buffer it merely buries it to the end of the buffer list. This allows me to pull it back up quickly with the q speed key or f9 f9 and regenerate the results with g.

     (add-hook 'org-agenda-mode-hook
               (lambda ()
                 (define-key org-agenda-mode-map "q" 'bury-buffer))
               'append)


;; 18.4 Checklist handling

;; Checklists are great for repeated tasks with lots of things that need to be done. For a long time
;; I was manually resetting the check boxes to unchecked when marking the repeated task DONE but no
;; more! There's a contributed org-checklist that can uncheck the boxes automagically when the task
;; is marked done.
;; Add the following to your .emacs

     ; (add-to-list 'load-path (expand-file-name "~/git/org-mode/contrib/lisp"))
     ; (require 'org-checklist)

;; and then to use it in a task you simply set the property RESET_CHECK_BOXES to t like this
;;
;;      * TODO Invoicing and Archive Tasks [0/7]
;;        DEADLINE: <2009-07-01 Wed +1m -0d>
;;        PROPERTIES:
;;        RESET_CHECK_BOXES: t
;;        END:
;;
;;        - [ ] Do task 1
;;        - [ ] Do task 2
;;        ...
;;        - [ ] Do task 7


;; 18.5 Backups

;; 18.6 Handling blocked tasks

;; Blocked tasks are tasks that have subtasks which are not in a done todo state. Blocked tasks show up in a grayed font by default in the agenda.
;; To enable task blocking set the following variable:

     (setq org-enforce-todo-dependencies t)

;; This setting prevents tasks from changing to DONE if any subtasks are still open. This works pretty well except for repeating tasks. I find I'm regularly adding TODO tasks under repeating tasks and not all of the subtasks need to be complete before the next repeat cycle.
;; You can override the setting temporarily by changing the task with C-u C-u C-u C-c C-t but I never remember that. I set a permanent property on the repeated tasks as follows:
;;
;;      * TODO New Repeating Task
;;        SCHEDULED: <2009-06-16 Tue +1w>
;;        PROPERTIES:
;;        NOBLOCKING: t
;;        END:
;;        ...
;;      ** TODO Subtask

;; This prevents the New Repeating Task from being blocked if some of the items under it are not complete.
;; Occassionally I need to complete tasks in a given order. Org-mode has a property ORDERED that enforces this for subtasks.

;;      * TODO Some Task
;;        PROPERTY:
;;        ORDERED: t
;;        END:
;;      ** TODO Step 1
;;      ** TODO Step 2
;;      ** TODO Step 3

;; In this case you need to complete Step 1 before you can complete Step 2, etc. and org-mode prevents the state change to a done task until the preceding tasks are complete.

;; 18.7 Org Task structure and presentation

;; 18.7.1 Controlling display of leading stars on headlines

;; Org-mode has the ability to show or hide the leading stars on task headlines. It's also possible to have headlines at odd levels only so that the stars and heading task names line up in sublevels.
;; To make org show leading stars use

     (setq org-hide-leading-stars nil)

;; I now use org-indent mode which hides leading stars.

;; 18.7.2 org-indent mode

;; I recently started using org-indent mode. I like this setting a lot. It removes the indentation in the org-file but displays it as if it was indented while you are working on the org file buffer.
;; org-indent mode displays as if org-odd-levels-only is true but it has a really clean look that I prefer over my old setup.
;; I have org-indent mode on by default at startup with the following setting:

     (setq org-startup-indented t)


;; 18.7.3 Handling blank lines

;; Blank lines are evil :). They keep getting inserted in between headlines and I don't want to see them in collapsed (contents) views. When I use TAB to fold (cycle) tasks I don't want to see any blank lines between headings.
;; The following setting hides blank lines between headings which keeps folded view nice and compact.

     (setq org-cycle-separator-lines 0)

;; I find extra blank lines in lists and headings a bit of a nuisance. To get a body after a list you need to include a blank line between the list entry and the body &#x2013; and indent the body appropriately. Most of my lists have no body detail so I like the look of collapsed lists with no blank lines better.
;; The following setting prevents creating blank lines before headings but allows list items to adapt to existing blank lines around the items:

     (setq org-blank-before-new-entry (quote ((heading)
                                              (plain-list-item . auto))))


;; 18.7.4 Adding new tasks quickly without disturbing the current task content

;; To create new headings in a project file it is really convenient to use C-RET, C-S-RET, M-RET, and M-S-RET. This inserts a new headline possibly with a TODO keyword. With the following setting

     (setq org-insert-heading-respect-content nil)

;; org inserts the heading at point for the M- versions and respects content for the C- versions. The respect content setting is temporarily turned on for the C- versions which adds the new heading after the content of the current item. This lets you hit C-S-RET in the middle of an entry and the new heading is added after the body of the current entry but still allow you to split an entry in the
;; middle with M-S-RET.

;; 18.7.5 Notes at the top

;; I enter notes for tasks with C-c C-z (or just z in the agenda). Changing tasks states also sometimes prompt for a note (e.g. moving to WAITING prompts for a note and I enter a reason for why it is waiting). These notes are saved at the top of the task so unfolding the task shows the note first.

     (setq org-reverse-note-order nil)


;; 18.7.6 Searching and showing results

;; Org-mode's searching capabilities are really effective at finding data in your org files. C-c / / does a regular expression search on the current file and shows matching results in a collapsed view of the org-file.
;; I have org-mode show the hierarchy of tasks above the matched entries and also the immediately following sibling task (but not all siblings) with the following settings:

     (setq org-show-following-heading t)
     (setq org-show-hierarchy-above t)
     (setq org-show-siblings (quote ((default))))

;; This keeps the results of the search relatively compact and mitigates accidental errors by
;; cutting too much data from your org file with C-k. Cutting folded data (including the &#x2026;)
;; can be really dangerous since it cuts text (including following subtrees) which you can't
;; see. For this reason I always show the following headline when displaying search results.

;; 18.7.7 Editing and Special key handling

;; Org-mode allows special handling of the C-a, C-e, and C-k keys while editing headlines. I also
;; use the setting that pastes (yanks) subtrees and adjusts the levels to match the task I am
;; pasting to. See the docstring (C-h v org-yank-adjust-subtrees) for more details on each variable
;; and what it does.
;; I have org-special-ctrl-a/e set to enable easy access to the beginning and end of headlines. I
;; use M-m or C-a C-a to get to the beginning of the line so the speed commands work and C-a to give
;; easy access to the beginning of the heading text when I need that.

     (setq org-special-ctrl-a/e t)
     (setq org-special-ctrl-k t)
     (setq org-yank-adjusted-subtrees t)


;; 18.8 Attachments

;; Attachments are great for getting large amounts of data related to your project out of your org-mode files. Before attachments came along I was including huge blocks of SQL code in my org files to keep track of changes I made to project databases. This bloated my org file sizes badly.
;; Now I can create the data in a separate file and attach it to my project task so it's easily located again in the future.
;; I set up org-mode to generate unique attachment IDs with org-id-method as follows:

     (setq org-id-method (quote uuidgen))

;; Say you want to attach a file x.sql to your current task. Create the file data in /tmp/x.sql and save it.
;; Attach the file with C-c C-a a and enter the filename: x.sql. This generates a unique ID for the task and adds the file in the attachment directory.
;;
;;      * Attachments                                                        :ATTACH:
;;        PROPERTIES:
;;        Attachments: x.sql
;;        ID:       f1d38e9a-ff70-4cc4-ab50-e8b58b2aaa7b
;;        END:

;; The attached file is saved in data/f1/d38e9a-ff70-4cc4-ab50-e8b58b2aaa7b/. Where it goes exactly
;; isn't important for me &#x2013; as long as it is saved and retrievable easily. Org-mode copies
;; the original file /tmp/x.sql into the appropriate attachment directory.
;; Tasks with attachments automatically get an ATTACH tag so you can easily find tasks with attachments with a tag search.
;; To open the attachment for a task use C-c C-a o. This prompts for the attachment to open and TAB completion works here.
;; The ID changes for every task header when a new ID is generated.
;; It's possible to use named directories for attachments but I haven't needed this functionality yet &#x2013; it's there if you need it.
;; I store my org-mode attachments with my org files in a subdirectory data. These are automatically added to my git repository along with any other org-mode changes I've made.

;;??: ;; 18.9 Deadlines and Agenda Visibility

;;??: ;; Deadlines and due dates are a fact or life. By default I want to see deadlines in the agenda 30 days before the due date.
;;??: ;; The following setting accomplishes this:

;;??:      (setq org-deadline-warning-days 30)

;;??: ;; This gives me plenty of time to deal with the task so that it is completed on or before the due date.
;;??: ;; I also use deadlines for repeating tasks. If the task repeats more often than once per month it would be always bugging me on the agenda view. For these types of tasks I set an explicit deadline warning date as follows:

;;??:      * TODO Pay Wages
;;??:        DEADLINE: <2009-07-01 Wed +1m -0d>

;;??: ;; This example repeats monthly and shows up in the agenda on the day it is due (with no prior warning). You can set any number of lead days you want on DEADLINES using -Nd where N is the number of days in advance the task should show up in the agenda. If no value is specified the default org-deadline-warning-days is used.

;;??: ;; 18.10 Exporting Tables to CSV

;;??: ;; I generate org-mode tables with details of task specifications and record structures for some of my projects. My clients like to use spreadsheets for this type of detail.
;;??: ;; It's easy to share the details of the org-mode table by exporting in HTML but that isn't easy for anyone else to work with if they need to edit data.
;;??: ;; To solve this problem I export my table as comma delimited values (CSV) and then send that to the client (or read it into a spreadsheet and email the resulting spreadsheet file).
;;??: ;; Org-mode can export tables as TAB or comma delimited formats. I set the default format to CSV with:

;;??:      (setq org-table-export-default-format "orgtbl-to-csv")

;;??: ;; Exporting to CSV format is the only one I use and this provides the default so I can just hit RETURN when prompted for the format.
;;??: ;; To export the following table I put the cursor inside the table and hit M-x org-table-export which prompts for a filename and the format which defaults to orgtbl-to-csv from the setting above.
;;??: ;;  __________________
;;??: ;; |One__|Two___|Three|
;;??: ;; |1____|1_____|2____|
;;??: ;; |3____|6_____|5____|
;;??: ;; |fred_|kpe___|mary_|
;;??: ;; |234.5|432.12|324.3|

;;??: ;; This creates the file with the following data
;;??: ;;
;;??: ;;      One,Two,Three
;;??: ;;      1,1,2
;;??: ;;      3,6,5
;;??: ;;      fred,kpe,mary
;;??: ;;      234.5,432.12,324.3


;;??: ;; 18.11 Minimize Emacs Frames

;;??: ;; Links to emails, web pages, and other files are sprinkled all over my org files. The following setting control how org-mode handles opening the link.

;;??:      (setq org-link-frame-setup (quote ((vm . vm-visit-folder)
;;??:                                         (gnus . org-gnus-no-new-news)
;;??:                                         (file . find-file))))

;;??:      ; Use the current window for C-c ' source editing
;;??:      (setq org-src-window-setup 'current-window)

;;??: ;; I like to keep links in the same window so that I don't end up with a ton of frames in my window manager. I normally work in a full-screen window and having links open in the same window just works better for me.
;;??: ;; If I need to work in multiple files I'll manually create the second frame with C-x 5 2 or split the window with C-x 4 2 or C-X 4 3. When I visit files in Emacs I normally want to replace the current window with the new content.

;;??: ;; 18.12 Logging stuff

;;??: ;; Most of my logging is controlled by the global org-todo-keywords
;;??: ;; My logging settings are set as follows:

;;??:      (setq org-log-done (quote time))
;;??:      (setq org-log-into-drawer t)
;;??:      (setq org-log-state-notes-insert-after-drawers nil)


;; My org-todo-keywords are set as follows:

;;      (setq org-todo-keywords
;;            (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
;;                    (sequence "WAITING(w@/@)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))


;;??: ;; This adds a log entry whenever a task moves to any of the following states:

;;??: ;; * to or out of DONE status
;;??: ;; * to WAITING status (with a note) or out of WAITING status
;;??: ;; * to HOLD status
;;??: ;; * to CANCELLED status (with a note) or out of CANCELLED status

;;??: ;; I keep clock times and states in the LOGBOOK drawer to keep my tasks uncluttered. If a task is WAITING then the reason for why it is waiting is near the top of the LOGBOOK and unfolding the LOGBOOK drawer provides that information. From the agenda simply hitting SPC on the task will reveal the LOGBOOK drawer.

;;??: ;; 18.13 Limiting time spent on tasks

;;??: ;; Org-mode has this great new feature for signalling alarms when the estimated time for a task is reached. I use this to limit the amount of time I spend on a task during the day.
;;??: ;; As an example, I've been working on this document for over two months now. I want to get it finished but I can't just work on it solely until it's done because then nothing else gets done. I want to do a little bit every day but limit the total amount of time I spend documenting org-mode to an hour a day.
;;??: ;; To this end I have a task
;;??: ;;
;;??: ;;      * NEXT Document my use of org-mode
;;??: ;;        LOGBOOK:...
;;??: ;;        PROPERTIES:
;;??: ;;        CLOCK_MODELINE_TOTAL: today
;;??: ;;        Effort:   1:00
;;??: ;;        END:

;;??: ;; The task has an estimated effort of 1 hour and when I clock in the task it gives me a total in the mode-line like this

;;??: ;;     --:**  org-mode.org   91% (2348,73) Git:master  (Org Fly yas Font)-----[0:35/1:00 (Document my use of org-mode)]-------

;;??: ;; I've spent 35 minutes of my 1 hour so far today on this document and other help on IRC.
;;??: ;; I set up an alarm so the Star Trek door chime goes off when the total estimated time is hit. (Yes I'm a Trekkie :) )

;;??:      (setq org-clock-sound "/usr/local/lib/tngchime.wav")

;;??: ;; When the one hour time limit is hit the alarm sound goes off and a message states that I should be done working on this task. If I switch tasks and try to clock in this task again I get the sound each and every time I clock in the task. This nags me to go work on something else :)
;;??: ;; You can use similar setups for repeated tasks. By default the last repeat time is recorded as a property when a repeating task is marked done. For repeating tasks the mode-line clock total counts since the last repeat time by default. This lets you accumulate time over multiple days and counts towards your estimated effort limit.


;; 18.14 Habit Tracking

;; John Wiegley recently added support for Habit tracking to org-mode.
;; I have lots of habits (some bad) but I'd still like to improve and build new good habits. This is what habit tracking is for. It shows a graph on the agenda of how well you have been doing on developing your habits.
;; I have habits like:

;; * Hand wash the dishes
;; * 30 minute brisk walk
;; * Clean the house

;; etc. and most of these need a push to get done regularly. Logging of the done state needs to be enabled for habit tracking to work.
;; A habit is just like a regular task except it has a special PROPERTY value setting and a special SCHEDULED date entry like this:
;;
;;      * TODO Update Org Mode Doc
;;        SCHEDULED: <2009-11-21 Sat .+7d/30d>
;;        [2009-11-14 Sat 11:45]
;;        PROPERTIES:
;;        STYLE: habit
;;        END:

;; This marks the task as a habit and separates it from the regular task display on the agenda. When you mark a habit done it shows up on your daily agenda the next time based on the first interval in the SCHEDULED entry (.+7d)
;; The special SCHEDULED entry states that I want to do this every day but at least every 2 days. If I go 3 days without marking it DONE it shows up RED on the agenda indicating that I have been neglecting this habit.
;; The world isn't going to end if you neglect your habits. You can hide and display habits quickly using the K key on the agenda.
;; These are my settings for habit tracking.

     ; Enable habit tracking (and a bunch of other modules)
     (setq org-modules (quote (org-bbdb
                               org-bibtex
                               org-crypt
                               org-gnus
                               org-id
                               org-info
                               org-jsinfo
                               org-habit
                               org-inlinetask
                               org-irc
                               org-mew
                               org-mhe
                               org-protocol
                               org-rmail
                               org-vm
                               org-wl
                               org-w3m)))

     ; position the habit graph on the agenda to the right of the default
     (setq org-habit-graph-column 50)

;;??: ;; During the day I'll turn off the habit display in the agenda with K. This is a persistent setting and since I leave my Emacs running for days at a time my habit display doesn't come back. To make sure I look at the habits daily I have the following settings to redisplay the habits in the agenda each day. This turns the habit display on again at 6AM each morning.

;;??:      (run-at-time "06:00" 86400 '(lambda () (setq org-habit-show-habits t)))


;;??: ;; 18.15 Habits only log DONE state changes

;;??: ;; I tend to keep habits under a level 1 task * Habits with a special logging property that only logs changes to the DONE state. This allows me to cancel a habit and not record a timestamp for it since that messes up the habit graph. Cancelling a habit just to get it off my agenda because it's undoable (like get up before 6AM) should not mark the habit as done today. I only cancel habits that repeat
;;??: ;; every day.
;;??: ;; My habit tasks look as follows - and I tend to have one in every org file that can have habits defined
;;??: ;;
;;??: ;;      * Habits
;;??: ;;        PROPERTIES:
;;??: ;;        LOGGING:  DONE(!)
;;??: ;;        ARCHIVE:  %s_archive::* Habits
;;??: ;;        END:


;;??: ;; 18.16 Auto revert mode

;;??: ;; I use git to synchronize my org-mode files between my laptop and my workstation. This normally requires saving all the current changes, pushing to a bare repo, and fetching on the other system. After that I need to revert all of my org-mode files to get the updated information.
;;??: ;; I used to use org-revert-all-org-buffers but have since discovered global-auto-revert-mode. With this setting any files that change on disk where there are no changes in the buffer automatically revert to the on-disk version.
;;??: ;; This is perfect for synchronizing my org-mode files between systems.

;;??:      (global-auto-revert-mode t)


;;??: ;; 18.17 Handling Encryption

;;??: ;; I used to keep my encrypted data like account passwords in a separate GPG encrypted file. Now I keep them in my org-mode files with a special tag instead. Encrypted data is kept in the org-mode file that it is associated with.
;;??: ;; org-crypt allows you to tag headings with a special tag crypt and org-mode can keep data in these headings encrypted when saved to disk. You decrypt the heading temporarily when you need access to the data and org-mode re-encrypts the heading as soon as you save the file.
;;??: ;; I use the following setup for encryption:

;;??:      (require 'org-crypt)
;;??:      ; Encrypt all entries before saving
;;??:      (org-crypt-use-before-save-magic)
;;??:      (setq org-tags-exclude-from-inheritance (quote ("crypt")))
;;??:      ; GPG key to use for encryption
;;??:      (setq org-crypt-key "F0B66B40")

;;??: ;; M-x org-decrypt-entry will prompt for the passphrase associated with your encryption key and replace the encrypted data where the point is with the plaintext details for your encrypted entry. As soon as you save the file the data is re-encrypted for your key. Encrypting does not require prompting for the passphrase - that's only for looking at the plain text version of the data.
;;??: ;; I tend to have a single level 1 encrypted entry per file (like * Passwords). I prevent the crypt tag from using inheritance so that I don't have encrypted data inside encrypted data. I found M-x org-decrypt-entries prompting for the passphrase to decrypt data over and over again (once per entry to decrypt) too inconvenient.
;;??: ;; I leave my entries encrypted unless I have to look up data - I decrypt on demand and then save the file again to re-encrypt the data. This keeps the data in plain text as short as possible.

;;??: ;; 18.17.1 Auto Save Files

;; Emacs temporarily saves your buffer in an autosave file while you are editing your org
;;buffer and a sufficient number of changes have accumulated. If you have decrypted subtrees in your
;;buffer these will be written to disk in plain text which possibly leaks sensitive information. To
;;combat this org-mode now asks if you want to disable the autosave functionality in this buffer.
;; Personally I really like the autosave feature. 99% of the time my encrypted entries are perfectly safe to write to the autosave file since they are still encrypted. I tend to decrypt an entry, read the details for what I need to look up and then immediately save the file again with C-x C-s which re-encrypts the entry immediately. This pretty much guarantees that my autosave files never have
;; decrypted data stored in them.
;; I disable the default org crypt auto-save setting as follows:

;;??:      (setq org-crypt-disable-auto-save nil)


;; 18.18 Speed Commands

;; There's an exciting feature called org-speed-commands in the org-mode.
;; Speed commands allow access to frequently used commands when on the beginning of a headline - similar to one-key agenda commands. Speed commands are user configurable and org-mode provides a good set of default commands.
;; I have the following speed commands set up in addition to the defaults. I don't use priorities so I override the default settings for the 1, 2, and 3 keys. I also disable cycling with 'c' and add 'q' as a quick way to get back to the agenda and update the current view.

     (setq org-use-speed-commands t)
     (setq org-speed-commands-user (quote (("0" . ignore)
                                           ("1" . ignore)
                                           ("2" . ignore)
                                           ("3" . ignore)
                                           ("4" . ignore)
                                           ("5" . ignore)
                                           ("6" . ignore)
                                           ("7" . ignore)
                                           ("8" . ignore)
                                           ("9" . ignore)

                                           ("a" . ignore)
                                           ("d" . ignore)
                                           ("h" . bh/hide-other)
                                           ("i" progn
                                            (forward-char 1)
                                            (call-interactively 'org-insert-heading-respect-content))
                                           ("k" . org-kill-note-or-show-branches)
                                           ("l" . ignore)
                                           ("m" . ignore)
                                           ("q" . bh/show-org-agenda)
                                           ("r" . ignore)
                                           ("s" . org-save-all-org-buffers)
                                           ("w" . org-refile)
                                           ("x" . ignore)
                                           ("y" . ignore)
                                           ("z" . org-add-note)

                                           ("A" . ignore)
                                           ("B" . ignore)
                                           ("E" . ignore)
                                           ("F" . bh/restrict-to-file-or-follow)
                                           ("G" . ignore)
                                           ("H" . ignore)
                                           ("J" . org-clock-goto)
                                           ("K" . ignore)
                                           ("L" . ignore)
                                           ("M" . ignore)
                                           ("N" . bh/narrow-to-org-subtree)
                                           ("P" . bh/narrow-to-org-project)
                                           ("Q" . ignore)
                                           ("R" . ignore)
                                           ("S" . ignore)
                                           ("T" . bh/org-todo)
                                           ("U" . bh/narrow-up-one-org-level)
                                           ("V" . ignore)
                                           ("W" . bh/widen)
                                           ("X" . ignore)
                                           ("Y" . ignore)
                                           ("Z" . ignore))))

     (defun bh/show-org-agenda ()
       (interactive)
       (switch-to-buffer "*Org Agenda*")
       (delete-other-windows))

;; The variable org-speed-commands-default sets a lot of useful defaults for speed command keys. The default keys I use the most are I and O for clocking in and out and t to change todo state.
;; J jumps to the current or last clocking task.
;; c and C are disabled so they self insert. I use TAB and S-TAB for cycling - I don't need c and C as well. TAB works everywhere while c and C only works on the headline and sometimes I accidentally cycle when I don't intend to.

;;??: ;; 18.19 Org Protocol

;;??: ;; Org_protocol is a great way to create capture notes in org-mode from other applications. I use this to create tasks to review interesting web pages I visit in Firefox.
;;??: ;; I have a special capture template set up for org-protocol to use (set up with the w key).
;;??: ;; My org-mode setup for org-protocol is really simple. It enables org-protocol and creates a single org-protocol capture template as described in 6.1.

;;??:      (require 'org-protocol)

;;??: ;; The bulk of the setup is in the Firefox application so that C-M-r on a page in Firefox will trigger the org-protocol capture template with details of the page I'm currently viewing in firefox.
;;??: ;; I set up org-protocol in firefox as described in Keybindings_for_Firefox.

;;??: ;; 18.20 Require a final newline when saving files

;;??: ;; The following setting was mainly for editing yasnippets where I want to be able to expand a snippet but stay on the same line. I used this mainly for replacing short strings or initials with full names for people during meeting notes. I now use abbrev-mode- for this and no longer need this setting.

;;??:      (setq require-final-newline nil)

;;??: ;; When I save a file in Emacs I want a final newline - this fits better with the source code projects I work on. This is the setting I use now:

;;??:      (setq require-final-newline t)


;;??: ;; 18.21 Insert inactive timestamps and exclude from export


(add-hook 'org-insert-heading-hook 'bh/insert-heading-inactive-timestamp 'append)

;;??: ;; Everytime I create a heading with M-RET or M-S-RET the hook invokes the function and it inserts an inactive timestamp like this
;;??: ;;
;;??: ;;      * <point here>
;;??: ;;        [2009-11-22 Sun 18:45]

;;??: ;; This keeps an automatic record of when tasks are created which I find very useful.
;;??: ;; I also have a short cut key defined to invoke this function on demand so that I can insert the inactive timestamp anywhere on demand.

;;??:      (global-set-key (kbd "<f9> t") 'bh/insert-inactive-timestamp)

;;??: ;; To prevent the timestamps from being exported in documents I use the following setting

;;??:      (setq org-export-with-timestamps nil)


;; 18.22 Return follows links

;; The following setting make RET insert a new line instead of opening links. This setting is a
;; love-hate relationship for me. When it first came out I immediately turned it off because I
;; wanted to insert new lines in front of my links and RET would open the link instead which at the
;; time I found extremely annoying. Since then I've retrained my fingers to hit RET at the end of
;; the previous line.

     (setq org-return-follows-link t)


;;??: ;; 18.23 Highlight clock when running overtime

;;??: ;; The current clocking task is displayed on the modeline. If this has an estimated time and we run over the limit I make this stand out on the modeline by changing the background to red as follows

;;??:      (custom-set-faces
;;??:        ;; custom-set-faces was added by Custom.
;;??:        ;; If you edit it by hand, you could mess it up, so be careful.
;;??:        ;; Your init file should contain only one such instance.
;;??:        ;; If there is more than one, they won't work right.
;;??:       '(org-mode-line-clock ((t (:foreground "red" :box (:line-width -1 :style released-button)))) t))


;;??: ;; 18.24 Meeting Notes

;;??: ;; I take meeting notes with org-mode. I record meeting conversations in point-form using org-mode lists. If action items are decided on in the meeting I'll denote them with a bullet and a TODO: or DONE: flag.
;;??: ;; A meeting is a task and it is complete when the meeting is over. The body of the task records all of the interesting meeting details. If TODO items are created in the meeting I make separate TODO tasks from those.
;;??: ;; I use the function bh/prepare-meeting-notes to prepare the meeting notes for emailing to the participants (in a fixed-width font like "Courier New"). As soon as the meeting is over the notes are basically ready for distribution &#x2013; there's not need to waste lots of time rewriting the minutes before they go out. I haven't bothered with fancy HTML output &#x2013; the content is more important
;;??: ;; than the style.
;;??: ;;
;;??: ;;      * TODO Sample Meeting
;;??: ;;        - Attendees
;;??: ;;          - [ ] Joe
;;??: ;;          - [X] Larry
;;??: ;;          - [X] Mary
;;??: ;;          - [X] Fred
;;??: ;;        - Joe is on vacation this week
;;??: ;;        - Status Updates
;;??: ;;          + Larry
;;??: ;;            - did this
;;??: ;;            - and that
;;??: ;;            - TODO: Needs to follow up on this
;;??: ;;          + Mary
;;??: ;;            - got a promotion for her recent efforts
;;??: ;;          + Fred
;;??: ;;            - completed all his tasks 2 days early
;;??: ;;            - needs more work
;;??: ;;            - DONE: everything
;;??: ;;
;;??: ;;
;;??: ;;      * TODO Sample Meeting
;;??: ;;         - Attendees
;;??: ;;           - [ ] Joe
;;??: ;;           - [X] Larry
;;??: ;;           - [X] Mary
;;??: ;;           - [X] Fred
;;??: ;;         - Joe is on vacation this week
;;??: ;;         - Status Updates
;;??: ;;           + Larry
;;??: ;;             - did this
;;??: ;;             - and that
;;??: ;;      >>>>>>>> TODO: Needs to follow up on this
;;??: ;;           + Mary
;;??: ;;             - got a promotion for her recent efforts
;;??: ;;           + Fred
;;??: ;;             - completed all his tasks 2 days early
;;??: ;;             - needs more work
;;??: ;;      >>>>>>>> DONE: everything

;;??: ;; Here is the formatting function. Just highlight the region for the notes and it turns tabs into spaces, and highlights todo items. The resulting notes are in the kill buffer ready to paste to another application.

;;??:      (defun bh/prepare-meeting-notes ()
;;??:        "Prepare meeting notes for email
;;??:         Take selected region and convert tabs to spaces, mark TODOs with leading >>>, and copy to kill ring for pasting"
;;??:        (interactive)
;;??:        (let (prefix)
;;??:          (save-excursion
;;??:            (save-restriction
;;??:              (narrow-to-region (region-beginning) (region-end))
;;??:              (untabify (point-min) (point-max))
;;??:              (goto-char (point-min))
;;??:              (while (re-search-forward "^\\( *-\\\) \\(TODO\\|DONE\\): " (point-max) t)
;;??:                (replace-match (concat (make-string (length (match-string 1)) ?>) " " (match-string 2) ": ")))
;;??:              (goto-char (point-min))
;;??:              (kill-ring-save (point-min) (point-max))))))


;;??: ;; 18.25 Highlights persist after changes

;;??: ;; I'm finding I use org-occur C-c / / a lot when trying to find details in my org-files. The following setting keeps the highlighted results of the search even after modifying the text. This allows me to edit the file without having to reissue the org-occur command to find the other matches in my file. C-c C-c removes the highlights.

;;??:      (setq org-remove-highlights-with-change nil)

;;??: ;; Setting this variable to t will automatically remove the yellow highlights as soon as the buffer is modified.

;;??: ;; 18.26 Getting up to date org-mode info documentation

;;??: ;; I use the org-mode info documentation from the git repository so I set up emacs to find the info files from git before the regular (out of date) system versions.

;;??:      (add-to-list 'Info-default-directory-list "~/git/org-mode/doc")


;;??: ;; 18.27 Prefer future dates or not?

;;??: ;; By default org-mode prefers dates in the future. This means that if today's date is May 2 and you enter a date for April 30th (2 days ago) org-mode will jump to April 30th of next year. I used to find this annoying when I wanted to look at what happened last Friday since I have to specify the year. Now I've trained my fingers to go back relatively in the agenda with b so this isn't really an issue
;;??: ;; for me anymore.
;;??: ;; To make org-mode prefer the current year when entering dates set the following variable:

;;??:      (setq org-read-date-prefer-future nil)

;;??: ;; I now have this variable set to ='time= so times before now (with no date specified) will default to tomorrow..

;;??:      (setq org-read-date-prefer-future 'time)


;;??: ;; 18.28 Automatically change list bullets

;;??: ;; I take point-form notes during meetings. Having the same list bullet for every list level makes it hard to read the details when lists are indented more than 3 levels.
;;??: ;; Org-mode has a way to automatically change the list bullets when you change list levels.
;;??: ;;  _____________________________________________
;;??: ;; |Current_List_Bullet|Next_indented_list_bullet|
;;??: ;; |+__________________|-________________________|
;;??: ;; |*__________________|-________________________|
;;??: ;; |1._________________|-________________________|
;;??: ;; |1)_________________|-________________________|


;;??:      (setq org-list-demote-modify-bullet (quote (("+" . "-")
;;??:                                                  ("*" . "-")
;;??:                                                  ("1." . "-")
;;??:                                                  ("1)" . "-"))))


;;??: ;; 18.29 Remove indentation on agenda tags view

;;??: ;; I don't like the indented view for sublevels on a tags match in the agenda but I want to see all matching tasks (including sublevels) when I do a agenda tag search (F12 m).
;;??: ;; To make all of the matched headings for a tag show at the same level in the agenda set the following variable:

;;??:      (setq org-tags-match-list-sublevels t)


;;??: ;; 18.30 Fontify source blocks natively

;;??: ;; I use babel for including source blocks in my documents with
;;??: ;;
;;??: ;;      #+begin_src LANG
;;??: ;;      ,  ...
;;??: ;;      #+end_src

;;??: ;; where LANG specifies the language to use (ditaa, dot, sh, emacs-lisp, etc) This displays the language contents fontified in both the org-mode source buffer and the exported document.
;;??: ;; See this 20.3 in this document for an example..

;;??: ;; 18.31 Agenda persistent filters

;;??: ;; This is a great feature! Persistent agenda filters means if you limit a search with / TAB SomeTag the agenda remembers this filter until you change it.
;;??: ;; Enable persistent filters with the following variable

;;??:      (setq org-agenda-persistent-filter t)

;;??: ;; The current filter is displayed in the modeline as {+SomeTag} so you can easily see what filter currently applies to your agenda view.
;;??: ;; I use this with FILETAGS to limit the displayed results to a single client or context.

;;??: ;; 18.32 Add tags for flagged entries

;;??: ;; Everyone so often something will come along that is really important and you know you want to be able to find it back fast sometime in the future.
;;??: ;; For these types of notes and tasks I add a special :FLAGGED: tag. This tag gets a special fast-key ? which matches the search key in the agenda for flagged items. See 11.1 for the setup of org-tag-alist for the FLAGGED entry.
;;??: ;; Finding flagged entries is then simple - just F12 ? and you get them all.

;;??: ;; 18.33 Mail links open compose-mail

;;??: ;; The following setting makes org-mode open mailto: links using compose-mail.

;;??:      (setq org-link-mailto-program (quote (compose-mail "%a" "%s")))


;;??: ;; 18.34 Composing mail from org mode subtrees

;;??: ;; It's possible to create mail from an org-mode subtree. I use C-c M-o to start an email message with the details filled in from the current subtree. I use this for repeating reminder tasks where I need to send an email to someone else. The email contents are already contained in the org-mode subtree and all I need to do is C-c M-o and any minor edits before sending it off.

;;??: ;; 18.35 Use smex for M-x ido-completion

;;??: ;; I discovered smex for IDO-completion for M-x commands after reading a post of the org-mode mailing list. I actually use M-x a lot now because IDO completion is so easy.
;;??: ;; Here's the smex setup I use

;;??:      (add-to-list 'load-path (expand-file-name "~/.emacs.d"))
;;??:      (require 'smex)
;;??:      (smex-initialize)

;;??:      (global-set-key (kbd "M-x") 'smex)
;;??:      (global-set-key (kbd "C-x x") 'smex)
;;??:      (global-set-key (kbd "M-X") 'smex-major-mode-commands)


;;??: ;; 18.36 Use Emacs bookmarks for fast navigation

;;??: ;; I've started using emacs bookmarks to save a location and return to it easily. Normally I want to get back to my currently clocking task and that's easy - just hit F11. When I'm working down a long checklist I find it convenient to set a bookmark on the next item to check, then go away and work on it, and return to the checkbox to mark it done.
;;??: ;; I use Emacs bookmarks for this setup as follows:

;;??:      ;; Bookmark handling
;;??:      ;;
;;??:      (global-set-key (kbd "<C-f6>") '(lambda () (interactive) (bookmark-set "SAVED")))
;;??:      (global-set-key (kbd "<f6>") '(lambda () (interactive) (bookmark-jump "SAVED")))

;;??: ;; When I want to save the current location I just hit C-f6 and then I can return to it with f6 anytime. I overwrite the same bookmark each time I set a new position.

;;??: ;; 18.37 Using org-mime to email

;;??: ;; I'm experimenting with sending mime mail from org. I've added C-c M=o key bindings in the org-mode-hook to generate mail from an org-mode subtree.

;;??:      (require 'org-mime)


;;??: ;; 18.38 Remove multiple state change log details from the agenda

;;??: ;; I skip multiple timestamps for the same entry in the agenda view with the following setting.

;;??:      (setq org-agenda-skip-additional-timestamps-same-entry t)

;;??: ;; This removes the clutter of extra state change log details when multiple timestamps exist in a single entry.

;;??: ;; 18.39 Drop old style references in tables

;;??: ;; I drop the old A3/B4 style references from tables when editing with the following setting.

;;??:      (setq org-table-use-standard-references (quote from))


;;??: ;; 18.40 Use system settings for file-application selection

;;??: ;; To get consistent applications for opening tasks I set the org-file-apps variable as follows:

;;??:      (setq org-file-apps (quote ((auto-mode . emacs)
;;??:                                  ("\\.mm\\'" . system)
;;??:                                  ("\\.x?html?\\'" . system)
;;??:                                  ("\\.pdf\\'" . system))))

;;??: ;; This uses the entries defined in my system mailcap settings when opening file extensions. This gives me consistent behaviour when opening an link to some HTML file with C-c C-o or when previewing an export.

;;??: ;; 18.41 Use the current window for the agenda


;;??:      ; Overwrite the current window with the agenda
;;??:      (setq org-agenda-window-setup 'current-window)


;;??: ;; 18.42 Delete IDs when cloning


;;??:      (setq org-clone-delete-id t)


;;??: ;; 18.43 Cycling plain lists

;;??: ;; Org mode can fold (cycle) plain lists.

;;??:      (setq org-cycle-include-plain-lists t)

;;??: ;; I find this setting useful when I have repeating tasks with lots of sublists with checkboxes. I can fold the completed list entries and focus on what is remaining easily.

;;??: ;; 18.44 Showing source block syntax highlighting

;;??: ;; It is possible to display org-mode source blocks fontified in their native mode. This allows colourization of keywords for C and shell script source etc. If I edit the source I use =C-c '= (control-c single quote) to bring up the source window which is then rendered with syntax highlighting in the native mode. This setting also shows the syntax highlighting when viewing in the org-mode buffer.

;;??:      (setq org-src-fontify-natively t)


;;??: ;; 18.45 Inserting Structure Template Blocks

;;??: ;; There is a shortcut key sequence in org-mode to insert structure templates quickly into your org files.
;;??: ;; I use example and source blocks often in my org files.
;;??: ;;  ___________________________________________________
;;??: ;; |Key_Sequence|Expands_to____________________________|
;;??: ;; |<_s_TAB_____|#+begin_src_&#x2026;_#+end_src________|
;;??: ;; |<_e_TAB_____|#+begin_example_&#x2026;_#+end_example|

;;??: ;; I've added a block for saving email text which I copy from MS Outlook at work so I have context associated with my org-mode tasks.
;;??: ;; The following lisp makes the blocks lowercase instead of the default upper case in org-mode.

;;??:      (setq org-structure-template-alist
;;??:            (quote (("s" "#+begin_src ?\n\n#+end_src" "<src lang=\"?\">\n\n</src>")
;;??:                    ("e" "#+begin_example\n?\n#+end_example" "<example>\n?\n</example>")
;;??:                    ("q" "#+begin_quote\n?\n#+end_quote" "<quote>\n?\n</quote>")
;;??:                    ("v" "#+begin_verse\n?\n#+end_verse" "<verse>\n?\n</verse>")
;;??:                    ("c" "#+begin_center\n?\n#+end_center" "<center>\n?\n</center>")
;;??:                    ("l" "#+begin_latex\n?\n#+end_latex" "<literal style=\"latex\">\n?\n</literal>")
;;??:                    ("L" "#+latex: " "<literal style=\"latex\">?</literal>")
;;??:                    ("h" "#+begin_html\n?\n#+end_html" "<literal style=\"html\">\n?\n</literal>")
;;??:                    ("H" "#+html: " "<literal style=\"html\">?</literal>")
;;??:                    ("a" "#+begin_ascii\n?\n#+end_ascii")
;;??:                    ("A" "#+ascii: ")
;;??:                    ("i" "#+index: ?" "#+index: ?")
;;??:                    ("I" "#+include %file ?" "<include file=%file markup=\"?\">"))))


;;??: ;; 18.46 NEXT is for tasks

;;??: ;; NEXT keywords are for tasks and not projects. I've added a function to the todo state change hook and clock in hook so that any parent tasks marked NEXT automagically change from NEXT to TODO since they are now projects and not tasks.

;;??:      (defun bh/mark-next-parent-tasks-todo ()
;;??:        "Visit each parent task and change NEXT states to TODO"
;;??:        (let ((mystate (or (and (fboundp 'org-state)
;;??:                                state)
;;??:                           (nth 2 (org-heading-components)))))
;;??:          (when mystate
;;??:            (save-excursion
;;??:              (while (org-up-heading-safe)
;;??:                (when (member (nth 2 (org-heading-components)) (list "NEXT"))
;;??:                  (org-todo "TODO")))))))

;;??:      (add-hook 'org-after-todo-state-change-hook 'bh/mark-next-parent-tasks-todo 'append)
;;??:      (add-hook 'org-clock-in-hook 'bh/mark-next-parent-tasks-todo 'append)


;;??: ;; 18.47 Startup in folded view

;;??: ;; Startup in folded view.

;;??:      (setq org-startup-folded t)

;;??: ;; I used to use content view by default so I could review org subtrees before archiving but my archiving workflow has changed so I no longer need this manual step.

;;??: ;; 18.48 Allow alphabetical list entries

;;??: ;; The following setting adds alphabetical lists like
;;??: ;;
;;??: ;;      a. item one
;;??: ;;      b. item two


;;??:      (setq org-alphabetical-lists t)


;;??: ;; 18.49 Using orgstruct mode for mail

;;??: ;; orgstruct++-mode is enabled in Gnus message buffers to aid in creating structured email messages.

;;??:      (add-hook 'message-mode-hook 'orgstruct++-mode 'append)
;;??:      (add-hook 'message-mode-hook 'turn-on-auto-fill 'append)
;;??:      (add-hook 'message-mode-hook 'bbdb-define-all-aliases 'append)
;;??:      (add-hook 'message-mode-hook 'orgtbl-mode 'append)
;;??:      (add-hook 'message-mode-hook 'turn-on-flyspell 'append)
;;??:      (add-hook 'message-mode-hook
;;??:                '(lambda () (setq fill-column 72))
;;??:                'append)
;;??:      (add-hook 'message-mode-hook
;;??:                '(lambda () (local-set-key (kbd "C-c M-o") 'org-mime-htmlize))
;;??:                'append)


;;??: ;; 18.50 Using flyspell mode to reduce spelling errors

;;??: ;; flyspell-mode is enabled for almost everything to help prevent creating documents with spelling errors.

;;??:      ;; flyspell mode for spell checking everywhere
;;??:      (add-hook 'org-mode-hook 'turn-on-flyspell 'append)

;;??:      ;; Disable C-c [ and C-c ] and C-c ; in org-mode
;;??:      (add-hook 'org-mode-hook
;;??:                '(lambda ()
;;??:                   ;; Undefine C-c [ and C-c ] since this breaks my
;;??:                   ;; org-agenda files when directories are include It
;;??:                   ;; expands the files in the directories individually
;;??:                   (org-defkey org-mode-map "\C-c["    'undefined)
;;??:                   (org-defkey org-mode-map "\C-c]"    'undefined)
;;??:                   (org-defkey org-mode-map "\C-c;"    'undefined))
;;??:                'append)

;;??:      (add-hook 'org-mode-hook
;;??:                (lambda ()
;;??:                  (local-set-key (kbd "C-c M-o") 'bh/mail-subtree))
;;??:                'append)

;;??:      (defun bh/mail-subtree ()
;;??:        (interactive)
;;??:        (org-mark-subtree)
;;??:        (org-mime-subtree))


;;??: ;; 18.51 Task Priorities

;;??: ;; I use the agenda to figure out what to do work on next. I don't use priorities at all normally but at work I occasionally get priorities from my manager. In this case I mark my tasks with the priorities from the external source just to track the values and force the agenda to display tasks in the priority order.
;;??: ;; I use priorities A-E where tasks without a specific priority are lowest priority E.

;;??:      (setq org-enable-priority-commands t)
;;??:      (setq org-default-priority ?E)
;;??:      (setq org-lowest-priority ?E)


;;??: ;; 18.52 New Exporter

;;??: ;; The current export engine invoked with C-c C-e is going to be replaced with a new system soon. I have the following settings so I can invoke the new exporter to see how it behaves compared to the existing one.

;;??:      (setq org-e-html-inline-images t)
;;??:      (setq org-export-html-style-extra "<link rel=\"stylesheet\" href=\"http://doc.norang.ca/org.css\" type=\"text/css\" />")
;;??:      (setq org-e-html-style-extra "<link rel=\"stylesheet\" href=\"http://doc.norang.ca/org.css\" type=\"text/css\" />")
;;??:      (setq org-e-html-style-include-default nil)
;;??:      (setq org-e-html-xml-declaration
;;??:            (quote
;;??:             (("was-html" . "")
;;??:              ("html" . "<?xml version=\"1.0\" encoding=\"%s\"?>")
;;??:              ("php" . "<?php echo \"<?xml version=\\\"1.0\\\" encoding=\\\"%s\\\" ?>\"; ?>"))))
;;??:      (setq org-e-latex-listings t)
;;??:      (setq org-e-html-style-include-scripts nil)
;;??:      (setq org-e-html-validation-link nil)

;;??:      (setq org-export-coding-system 'utf-8)

;;??:      (require 'org-export)

;;??: ;; To invoke the new exporter use M-x org-export-dispatch.

;;??: ;; 18.53 Preserving source block indentation

;;??: ;; I do not preserve indentation for source blocks mainly because this doesn't look nice with indented org-files. The only reason I've found to preserve indentation is when TABs in files need to be preserved (e.g. Makefiles). I don't normally edit these files in org-mode so I leave this setting turned off.
;;??: ;; I've changed the default block indentation so that it is not indented from the text in the org file. This allows editing source blocks in place without requiring use of =C-c '= so that code lines up correctly.

;;??:      (setq org-src-preserve-indentation nil)
;;??:      (setq org-edit-src-content-indentation 0)


;;??: ;; 18.54 Prevent editing invisible text

;;??: ;; The following setting prevents accidentally editing hidden text when the point is inside a folded region. This can happen if you are in the body of a heading and globally fold the org-file with S-TAB
;;??: ;; I find invisible edits (and undo's) hard to deal with so now I can't edit invisible text. C-c C-r (org-reveal) will display where the point is if it is buried in invisible text to allow editing again.

;;??:      (setq org-catch-invisible-edits 'error)


;;??: ;; 18.55 Use utf-8 as default coding system

;;??: ;; I use utf-8 as the default coding system for all of my org files.

;;??:      (prefer-coding-system 'utf-8)
;;??:      (set-charset-priority 'unicode)
;;??:      (setq default-process-coding-system '(utf-8-unix . utf-8-unix))


;;??: ;; 18.56 Keep clock durations in hours

;;??: ;; The default for clock durations has changed to include days which is 24 hours. At work I like to think of a day as 6 hours of work (the rest of the time is lost in meetings and other overhead on average) so displaying clock durations in days doesn't make sense to me.
;;??: ;; The following setting displays clock durations (from C-c C-x C-d in hours and minutes.

;;??:      (setq org-time-clocksum-format
;;??:            '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))


;;??: ;; 19 Things I Don't Use (Anymore)

;;??: ;; This is a partial list of things I know about but do not use. org-mode is huge with tons of features. There are features out there that I don't know about yet or haven't explored so this list is not going to be complete.

;;??: ;; 19.1 Archive Sibling

;;??: ;; This was a cute idea but I find archiving entire complete subtrees better. I don't mind having a bunch of tasks marked DONE (but not archived)

;;??: ;; 19.2 Strike-through emphasis

;;??: ;; Strike-through emphasis is just unreadable and tends to only show up when pasting data from other files into org-mode. This just removes the strike-through completely which I find a lot nicer.

;;??:      (setq org-emphasis-alist (quote (("*" bold "<b>" "</b>")
;;??:                                       ("/" italic "<i>" "</i>")
;;??:                                       ("_" underline "<span style=\"text-decoration:underline;\">" "</span>")
;;??:                                       ("=" org-code "<code>" "</code>" verbatim)
;;??:                                       ("~" org-verbatim "<code>" "</code>" verbatim))))


;;??: ;; 19.3 Subscripts and Superscripts

;;??: ;; I don't currently write documents that need subscripts and superscript support. I disable handling of _ and ^ for subscript and superscripts with

;;??:      (setq org-use-sub-superscripts nil)


;;??: ;; 19.4 Yasnippet

;;??: ;; Yasnippet is cool but I don't use this anymore. I've replaced yasnippet with a combination of abbrev-mode and skeletons which are available by default in Emacs.
;;??: ;; The following description applies to yasnippet version 0.5.10. The setup requirements may have changed with newer versions.
;;??: ;; You type the snippet name and TAB and yasnippet expands the name with the contents of the snippet text - substituting snippet variables as appropriate.
;;??: ;; Yasnippet comes with lots of snippets for programming languages. I used a few babel related snippets with org-mode.
;;??: ;; I downloaded and installed the unbundled version of yasnippet so that I can edit the predefined snippets. I unpacked the yasnippet software in my ~/.emacs.d/plugins directory, renamed yasnippet0.5.10 to yasnippet and added the following setup in my .emacs:

;;??:      (add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins"))

;;??:      (require 'yasnippet)
;;??:      (yas/initialize)
;;??:      (yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;;??:      ;; Make TAB the yas trigger key in the org-mode-hook and enable flyspell mode and autofill
;;??:      (add-hook 'org-mode-hook
;;??:                (lambda ()
;;??:                  ;; yasnippet
;;??:                  (make-variable-buffer-local 'yas/trigger-key)
;;??:                  (org-set-local 'yas/trigger-key [tab])
;;??:                  (define-key yas/keymap [tab] 'yas/next-field-group)
;;??:                  ;; flyspell mode for spell checking everywhere
;;??:                  (flyspell-mode 1)
;;??:                  ;; auto-fill mode on
;;??:                  (auto-fill-mode 1)))

;;??: ;; I used snippets for the following:

;;??: ;; * begin for generic #+begin_ blocks
;;??: ;; * dot for graphviz
;;??: ;; * uml for PlantUML graphics
;;??: ;; * sh for bash shell scripts
;;??: ;; * elisp for emacs lisp code
;;??: ;; * initials of a person converts to their full name I used this while taking meeting notes

;;??: ;; Here is the definition for the begin snippet:
;;??: ;; org-mode Yasnippet: ~/.emacs.d/plugins/yasnippet/snippets/text-mode/org-mode/begin
;;??: ;;
;;??: ;;      #name : #+begin_...#+end_
;;??: ;;      # --
;;??: ;;      #+begin_$1 $2
;;??: ;;      $0
;;??: ;;      #+end_$1

;;??: ;; I used this to create #+begin_* blocks like

;;??: ;; * #+begin_example
;;??: ;; * #+begin_src
;;??: ;; * etc.

;;??: ;; Simply type begin and then TAB it replaces the begin text with the snippet contents. Then type src TAB emacs-lisp TAB and your snippet block is done. I've shortened this specific sequence to just elisp TAB since I use it fairly often.
;;??: ;; Hit C-c SingeQuote(') and insert whatever emacs-lisp code you need. While in this block you're in a mode that knows how to format and colourize emacs lisp code as you enter it which is really nice. C-c SingleQuote(') exits back to org-mode. This recognizes any emacs editing mode so all you have to do is enter the appropriate mode name for the block.
;;??: ;; dot
;;??: ;;
;;??: ;;      #dot : #+begin_src dot ... #+end_src
;;??: ;;      # --
;;??: ;;      #+begin_src dot :file $1 :cmdline -Kdot -Tpng
;;??: ;;      $0
;;??: ;;      #+end_src

;;??: ;; uml
;;??: ;;
;;??: ;;      #uml : #+begin_src plantuml ... #+end_src
;;??: ;;      # --
;;??: ;;      #+begin_src plantuml :file $1
;;??: ;;      $0
;;??: ;;      #+end_src

;;??: ;; sh
;;??: ;;
;;??: ;;      #sh: #+begin_src sh ... #+end_src
;;??: ;;      # --
;;??: ;;      #+begin_src sh :results output
;;??: ;;      $0
;;??: ;;      #+end_src

;;??: ;; elisp
;;??: ;;
;;??: ;;      #elisp : #+begin_src emacs-lisp ...#+end_src emacs-lisp
;;??: ;;      # --
;;??: ;;      #+begin_src emacs-lisp
;;??: ;;      $0
;;??: ;;      #+end_src
;;??: ;;
;;??: ;; This is a great time saver.

;;??: ;; 19.5 Show headings at odd levels only or odd-even levels

;;??: ;; This has been replaced by org-indent-mode
;;??: ;; I've converted my files between odd-levels-only and odd-even using the functions org-convert-to-odd-levels and org-convert-to-oddeven-levels functions a number of times. I ended up going back to odd-even levels to reduce the amount of leading whitespace on tasks. I didn't find that lining up the headlines and tasks in odd-levels-only to be all that helpful.

;;??:      (setq org-odd-levels-only nil)


;;??: ;; 19.6 Propagate STARTED to parent tasks

;;??: ;; I used to have a STARTED and NEXT task state. These were basically the same except STARTED indicated that I've clocked some time on the task. Since then I've just moved to using NEXT for this.
;;??: ;; The following code used to propagate the STARTED task up the project tree but I don't use this anymore.
;;??: ;; When a task is marked STARTED (either manually or by clocking it in) the STARTED state propagates up the tree to any parent tasks of this task that are TODO or NEXT. As soon as I work on the first NEXT task in a tree the project is also marked STARTED. This helps me keep track of things that are in progress.
;;??: ;; Here's the setup I use to propagate STARTED to parent tasks:

;;??:      ;; Mark parent tasks as started
;;??:      (defvar bh/mark-parent-tasks-started nil)

;;??:      (defun bh/mark-parent-tasks-started ()
;;??:        "Visit each parent task and change TODO states to STARTED"
;;??:        (unless bh/mark-parent-tasks-started
;;??:          (when (equal org-state "STARTED")
;;??:            (let ((bh/mark-parent-tasks-started t))
;;??:              (save-excursion
;;??:                (while (org-up-heading-safe)
;;??:                  (when (member (nth 2 (org-heading-components)) (list "TODO" "NEXT"))
;;??:                    (org-todo "STARTED"))))))))

;;??:      (add-hook 'org-after-todo-state-change-hook 'bh/mark-parent-tasks-started 'append)


;;??: ;; 19.7 Automatically clocking tasks

;;??: ;; I used to spend time on an open source project called BZFlag. During work for releases I want to clock the time I spend testing the new BZFlag client. I have a key binding in my window manager that runs a script which starts the clock on my testing task, runs the BZFlag client, and on exit resumes the clock on the previous clocking task.
;;??: ;; The testing task has an ID property of dcf55180-2a18-460e-8abb-a9f02f0893be and the following elisp code starts the clock on this task.

;;??:      (defun bh/clock-in-bzflagt-task ()
;;??:        (interactive)
;;??:        (bh/clock-in-task-by-id "dcf55180-2a18-460e-8abb-a9f02f0893be"))

;;??: ;; This is invoked by a bash shell script as follows:

;;??:      #!/bin/sh
;;??:      emacsclient -e '(bh/clock-in-bzflagt-task)'
;;??:      ~/git/bzflag/trunk/bzflag/src/bzflag/bzflag -directory ~/git/bzflag/trunk/bzflag/data $*
;;??:      emacsclient -e '(bh/resume-clock)'

;;??: ;; The resume clock function just returns the clock to the previous clocking task

;;??:      (defun bh/resume-clock ()
;;??:        (interactive)
;;??:        (if (marker-buffer org-clock-interrupted-task)
;;??:            (org-with-point-at org-clock-interrupted-task
;;??:              (org-clock-in))
;;??:          (org-clock-out)))

;;??: ;; If no task was clocking bh/resume-clock just stops the clock.

;;??: ;; 20 Using Git for Automatic History, Backups, and Synchronization

;;??: ;; Editing folded regions of your org-mode file can be hazardous to your data. My method for dealing with this is to put my org files in a Git source repository.
;;??: ;; My setup saves all of my org-files every hour and creates a commit with my changes automatically. This lets me go back in time and view the state of my org files for any given hour over the lifetime of the document. I've used this once or twice to recover data I accidentally removed while editing folded regions.

;;??: ;; 20.1 Automatic Hourly Commits

;;??: ;; My Emacs setup saves all org buffers at 1 minute before the hour using the following code in my .emacs

;;??:      (run-at-time "00:59" 3600 'org-save-all-org-buffers)

;;??: ;; A cron job runs at the top of the hour to commit any changes just saved by the call to org-save-all-org-buffers above. I use a script to create the commits so that I can run it on demand to easily commit all modified work when moving from one machine to another.
;;??: ;; crontab details:

;;??: ;;     0 * * * * ~/bin/org-git-sync.sh >/dev/null


;;??: ;; 20.2 Git - Edit files with confidence

;;??: ;; I use git in all of my directories where editing a file should be tracked.
;;??: ;; This means I can edit files with confidence. I'm free to change stuff and break things because it won't matter. It's easy to go back to a previous working version or to see exactly what changed since the last commit. This is great when editing configuration files (such as apache webserver, bind9 DNS configurations, etc.)
;;??: ;; I find this extremely useful where your edits might break things and having git tracking the changes means if you break it you can just go back to the previous working version easily. This is also true for package upgrades for software where the upgrade modifies the configuration files.
;;??: ;; I have every version of my edits in a local git repository.

;;??: ;; 20.3 Git Repository synchronization

;;??: ;; I acquired a Eee PC 1000 HE which now serves as my main road-warrior laptop replacing my 6 year old Toshiba Tecra S1.
;;??: ;; I have a server on my LAN that hosts bare git repositories for all of my projects. The problem I was facing is I have to leave in 5 minutes and want to make sure I have up-to-date copies of everything I work on when I take it on the road (without Internet access).
;;??: ;; To solve this I use a server with bare git repositories on it. This includes my org-mode repositories as well as any other git repositories I'm interested in.
;;??: ;; Just before I leave I run the git-sync script on my workstation to update the bare git repositories and then I run it again on my Eee PC to update all my local repositories on the laptop. For any repositories that give errors due to non-fast-forward merges I manually merge as required and rerun git-sync until it reports no errors. This normally takes a minute to two to do. Then I grab my Eee PC
;;??: ;; and leave. When I'm on the road I have full up-to-date history of all my git repositories.
;;??: ;; The git-sync script replaces my previous scripts with an all-in-one tool that basically does this:
;;??: ;; * for each repository on the current system
;;??: ;;
;;??: ;;      o fetch objects from the remote
;;??: ;;      o for each branch that tracks a remote branch
;;??: ;;
;;??: ;;        # Check if the ref can be moved
;;??: ;;
;;??: ;;          # fast-forwards if behind the remote repository and is fast-forwardable
;;??: ;;          # Does nothing if ref is up to date
;;??: ;;          # Pushes ref to remote repository if ref is ahead of remote repository and fast-forwardable
;;??: ;;          # Fails if ref and remote have diverged
;;??: ;; This automatically advances changes on my 35+ git repositories with
;;minimal manual intervention. The only time I need to manually do something in
;;a repository is when I make changes on my Eee PC and my workstation at the
;;same time - so that a merge is required.
;;??: ;; Here is the git-sync script

