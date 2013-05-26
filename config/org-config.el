;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; outfit
(setq org-hide-leading-stars nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; export
;; (setq org-export-html-inline-images nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; diary and calendar
(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7
      diary-show-holidays-flag nil
      calendar-week-start-day 1) ;; week starts on Monday
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; refile
(setq org-refile-targets (quote ( (org-agenda-files :tag . "unsorted") (nil :maxlevel . 1))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; workflow behaviour
(setq org-extend-today-until 6) ;; if you work late
(setq org-hierarchical-checkbox-statistics nil)
(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
(setq org-log-done 'time)
(setq org-todo-keywords
      '((sequence "TODO" "TESTING" "|" "DONE(!)" "REJECTED(@)")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; capturing
(setq org-capture-templates
      '(("e"
	 "Emacs Todo"
	 entry
	 (file+headline "~/org/emacs.org" "Emacs Unsorted")
	 "** TODO %?\n  Source: %a\n  %i\n")
        ("w"
         "Website"
         entry
         (file+headline "~/org/capture.org" "Websites")
         "** TODO %:description\n\n  Source: %u, %c\n\n  %i"
         :empty-lines 1
	 :immediate-finish
	 :killbuffer 1)
        ))
(defun my-org-protocol-capture (info)
  "Wrapper around org-protocol-capture to print a system notification"
  (let* ((parts (org-protocol-split-data info t))
	 (template (or (and (>= 2 (length (car parts))) (pop parts))
		       org-protocol-default-template-key))
	 (url (org-protocol-sanitize-uri (car parts)))
	 )
    (message "hello world?")
    (if (and (boundp 'org-stored-links)
             (fboundp 'org-capture)
    	   (org-protocol-do-capture info 'org-capture))
	(todochiku-message "Link captured." (concat "Your <a href=\"" url "\">link</a> has been captured by org-mode.") "/usr/share/icons/oxygen/64x64/status/dialog-information.png")
    nil)))

(setq org-protocol-protocol-alist
  '(
    ("my-org-capture"     :protocol "my-capture"     :function my-org-protocol-capture  :kill-client t)
    ))

(setq org-protocol-default-template-key "w")
;; (setq org-capture-templates
;;  '(("t" "Todo" entry (file+headline "/path/to/notes.org" "Tasks")
;;         "* TODO %?\n  %i\n  %a")
;;    ("l" "Link" entry (file+olp "/path/to/notes.org" "Web Links")
;;         "* %a\n %?\n %i")
;;    ("j" "Journal" entry (file+datetree "/path/to/journal.org")
;;         "* %?\nEntered on %U\n  %i\n  %a")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; abbreviations

(setq org-link-abbrev-alist
      '(("emacswiki" . "http://www.emacswiki.org/emacs/%s")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keybindings

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
;;(setq org-treat-S-cursor-todo-selection-as-state-change nil)
(setq org-return-follows-link t)
