(package-require 'idomenu)
(package-require 'flx-ido)

(require 'idomenu)
(require 'flx-ido)

;; Enable
(ido-mode t)
(flx-ido-mode t)

(setq ido-enable-prefix nil
      ido-create-new-buffer 'always
      ido-max-prospects 10
      ido-default-file-method 'selected-window
      ido-everywhere 1)

(icomplete-mode 1)

;; Show previously opened buffers in ido-switch-buffer
(setq ido-use-virtual-buffers t)

;; Vertical ido
(package-require 'ido-vertical-mode)
(ido-vertical-mode)

;; Bind `~` to go to homedir when in ido-find-file; http://whattheemacsd.com/setup-ido.el-02.html
(add-hook 'ido-setup-hook
 (lambda ()
   ;; Go straight home
   (define-key ido-file-completion-map
     (kbd "~")
     (lambda ()
       (interactive)
       (if (looking-back "/")
           (insert "~/")
         (call-interactively 'self-insert-command))))))

(provide 'luminous-ido)
