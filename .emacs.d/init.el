;; EMACS is slow to start unless to has a FQDN.
;; On Linux, update the /etc/hosts file.

;; Remove all the GUI cruft.
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Always ALWAYS use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)


;; Add .emacs.d to load-path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;; Add every subdirectory of ~/.emacs.d/site-lisp to the load path
(dolist
    (project (directory-files (concat dotfiles-dir "site-lisp") t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(require 'cl)
(defun esk-online? ()
  "Detect if there's a network connection."
  (if (and (functionp 'network-interface-list)
           (network-interface-list))
      (some (lambda (iface) (unless (equal "lo" (car iface))
                         (member 'up (first (last (network-interface-info
                                                   (car iface)))))))
            (network-interface-list))
    t))

;; ELPA
;; EMACS package repositories.
(setq package-user-dir (concat dotfiles-dir "elpa"))
(require 'package)
(dolist (source '(("org-mode" . "http://orgmode.org/elpa/")
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)
(when (esk-online?)
  (unless package-archive-contents (package-refresh-contents)))

(defun package-require (pkg)
  "Install a package only if it's not already installed.
   Does not actually call (require) on the package."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;; Finder does not give apps the same path as when run from shell.
;; (Only do this from OSX)
(if (eq system-type 'darwin)
    (progn
      (package-require 'exec-path-from-shell)
      (exec-path-from-shell-initialize)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat dotfiles-dir "bak")))))

(setq pkg-list
        '(luminous-defuns
          luminous-theme
          luminous-editing
          luminous-codestyle
          luminous-complete
          luminous-smartparens
          luminous-lisp
          luminous-clojure
          luminous-latex
          luminous-bindings
          luminous-ido
          luminous-spelling
          luminous-flycheck
          luminous-rainbow
          luminous-snippets))

(dolist (file pkg-list)
  (require file))
