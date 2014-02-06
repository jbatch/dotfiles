;;; For posting to my blog from EMACS
(package-require 'xml-rpc)
(package-require 'metaweblog)
(package-require 'org2blog)

(setq org2blog/wp-blog-alist
      '(("luminousmonkey"
         :url "http://luminousmonkey.org/wordpress/xmlrpc.php"
         :username "aldredmr"
         :tags-as-categories nil)))

(provide 'luminous-blog)
