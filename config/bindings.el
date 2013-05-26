;; Place your bindings here.

(global-set-key (kbd "C-c C-<left>") 'windmove-left)
(global-set-key (kbd "C-c C-<right>") 'windmove-right)
(global-set-key (kbd "C-c C-<up>") 'windmove-up)
(global-set-key (kbd "C-c C-<down>") 'windmove-down)
(global-set-key (kbd "C-c C-<next>") 'switch-to-minibuffer-window)

(global-set-key (kbd "C-<kp-4>") 'shrink-window-horizontally)
(global-set-key (kbd "C-<kp-6>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<kp-8>") 'shrink-window)
(global-set-key (kbd "C-<kp-2>") 'enlarge-window)

(global-set-key (kbd "C-c k") 'delete-this-buffer-and-file)
(global-set-key (kbd "C-c R") 'rename-current-file-or-buffer)

(define-key global-map (kbd "C-<kp-add>") 'text-scale-increase)
(define-key global-map (kbd "C-<kp-subtract>") 'text-scale-decrease)
(define-key global-map (kbd "C-=") 'er/expand-region)
