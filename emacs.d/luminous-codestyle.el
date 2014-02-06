;; Tab indentation is a disease; a cancer of this planet.
(set-default 'indent-tabs-mode nil)

;; Indentation mode
(electric-indent-mode 1)

;; Default indentation
(setq-default tab-width 4)

;; I mean, _seriously_...
(setq sentence-end-double-space nil)

;; Enforce proper whitespace
(package-require 'ethan-wspace)
(global-ethan-wspace-mode 1)

;; In C, use the linux kernel style for now.
;; Be sure that ethan-wspace doesn't take TABs out of C
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-tabs-mode t
                  c-basic-offset 8
                  tab-width 8)
            (c-set-style "linux")))

(setq c-default-style "linux")

(provide 'luminous-codestyle)
