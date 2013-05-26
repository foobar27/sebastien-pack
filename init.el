;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

(live-add-pack-lib "vendor/org-mode")

;; basic configuration
(setq live-disable-zone t)

;; Load bindings config
(live-load-config-file "utils.el")
(live-load-config-file "html-utils.el")
(live-load-config-file "bindings.el")
(live-load-config-file "user-config.el")
(live-load-config-file "make-password.el")
(live-load-config-file "org-config.el")
(live-load-config-file "proced-config.el")

(setq comment-empty-lines t)

(require 'magit-blame)

(live-add-pack-lib "vendor/org-mode")
(live-add-pack-lib "vendor/org-reveal")


(live-add-pack-lib "vendor/restclient")
(require 'restclient)

(live-add-pack-lib "vendor/mingus")
(require 'mingus)

;;(live-add-pack-lib "vendor/midje-mode")
;;(require 'midje-mode)
;;(add-hook 'clojure-mode-hook 'midje-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; refactoring
(live-add-pack-lib "vendor/s")
(live-add-pack-lib "vendor/dash")
(live-add-pack-lib "vendor/clj-refactor")
(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
			       (clj-refactor-mode 1)
			       (cljr-add-keybindings-with-modifier "C-s-")
			       ;; eg. rename files with `C-s-r C-s-f`.
			       ))
 ;; - `rf`: rename file, update ns-declaration, and then query-replace new ns in project.
 ;; - `ar`: add :require to namespace declaration, then jump back
 ;; - `au`: add :use to namespace declaration, then jump back
 ;; - `ai`: add :import to namespace declaration, then jump back

(require 'secrets)

(load "~/.secrets.el.gpg")

(require 'jabber-autoloads)
(setq
  jabber-history-enabled t
  jabber-use-global-history nil
  jabber-backlog-number 40
  jabber-backlog-days 1000
 )
(add-hook 'jabber-chat-mode-hook 'goto-address)
(add-hook 'jabber-alert-message-hooks 'libnotify-jabber-notify)

(live-load-config-file "accounts.el")

(live-add-pack-lib "vendor/haskell-mode")
(require 'haskell-mode)
(setq auto-mode-alist
      (append '(("\\.hs\\'" . haskell-mode))
	      auto-mode-alist))

(set-default 'truncate-lines t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO move this into a cpp-pack
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; start emacs daemon
(server-mode)
(if (not (server-running-p))
    (server-start))
