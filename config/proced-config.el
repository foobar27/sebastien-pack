;;  JSTACK
(defun jstack (pid)
 "Calls jstack and displays the result in a new buffer."
 (interactive "nPid: ")
 (shell-command (concat "jstack " (number-to-string pid)) "*jstack*")
)

(defun jstack-proced ()
 "Calls jstack for the pid at point"
 (interactive)
 (jstack (proced-pid-at-point))
)

(add-hook 'proced-mode-hook 'my-proced-mode-hook)

(defun my-proced-mode-hook ()
 (local-set-key "j" 'jstack-proced))
