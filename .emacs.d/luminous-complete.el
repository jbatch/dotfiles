;; Fuzzy matching and popups
(package-require 'fuzzy)
(package-require 'popup)

(require 'fuzzy)
(require 'popup)

(package-require 'auto-complete)
(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)
(ac-flyspell-workaround)

;; Autocomplete dictionaries are expected to be in site-lisp.
;; This is pulled in as a Git submodule.
(add-to-list 'ac-dictionary-directories
	     (concat dotfiles-dir "site-lisp/auto-complete/dict"))

(global-auto-complete-mode t)
(setq ac-auto-show-menu t)
(setq ac-dwim t)
(setq ac-use-menu-map t)
(setq ac-quick-help-delay 1)
(setq ac-quick-help-height 60)
(setq ac-disable-inline t)
(setq ac-show-menu-immediately-on-auto-complete t)
(setq ac-auto-start 2)
(setq ac-candidate-menu-min 0)

(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-yasnippet))

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode))
  (add-to-list 'ac-modes mode))

(provide 'luminous-complete)
