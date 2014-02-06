;;; My Org mode config.

;;; I use Dropbox for keeping Org mode in sync and the location of the
;;; Dropbox directory is different per system, basically it's just the
;;; difference between Windows and a UNIX.

(package-require 'org)

(if (string= window-system "w32")
    (setq org-directory "~/../../DropBox/GTD")
  (setq org-directory "~/Dropbox/GTD"))

(setq main-gtd-org-file (concat org-directory "/newgtd.org"))
(setq someday-gtd-org-file (concat org-directory "/someday.org"))
(setq journal-gtd-org-file (concat org-directory "/journal.org"))

(setq org-cycle-separator-lines 1)

(setq org-agenda-files (file-expand-wildcards (concat org-directory "/*.org")))

(setq org-refile-targets '((main-gtd-org-file :maxlevel . 1)
                           (someday-gtd-org-file :level . 2)))

(setq org-default-notes-file main-gtd-org-file)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline main-gtd-org-file "Tasks")
         "* TODO %^{Brief Description} %^g\n  %?\n  Added: %U\n \n\n")
        ("j" "Journal" entry (file+datetree journal-gtd-org-file)
         "** %^{Heading}")
        ("p" "Projects" entry (file+headline main-gtd-org-file "Projects")
         "* %^{Project Name}%?")))

(setq org-agenda-custom-commands
      '(("H" "Office and Home Lists"
         ((agenda)
          (tags-todo "OFFICE")
          (tags-todo "ERRANDS")
          (tags-todo "HOME")
          (tags-todo "COMPUTER")
          (tags-todo "DVD")
          (tags-todo "READING")))
        ("D" "Daily Action List"
         ((agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up))))
                      (org-deadline-warning-days 0)))))))

;;; Bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(provide 'luminous-org)
