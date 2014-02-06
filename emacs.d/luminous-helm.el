;;; Helm will steer you in the right direction. Duh.

(package-require 'helm)
(global-set-key (kbd "<f13>") 'helm-mini)

;; Projectile support
(package-require 'helm-projectile)
(global-set-key (kbd "C-c <f13>") 'helm-projectile)

(provide 'luminous-helm)
