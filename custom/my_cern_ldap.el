;;; -*- lexical-binding: nil; -*-

;;; my_cern_ldap --- Summary
;;; Code:
;;; Commentary: needs the ldapsearch package

(use-package cern-ldap
  :ensure t
  :custom
  (cern-ldap-buffer-name-format "*LDAP (%t) %l*")
  (cern-ldap-user-full-name-matching-type 'strict)
  (cern-ldap-server-url
   (cond
    ((and (boundp 'my/in-cern-net-p) my/in-cern-net-p)
     "ldap://xldap.cern.ch:389")
    (t
     "ldap://localhost:1389")))
  )
  
(provide 'my_cern_ldap)
;;; my_cern_ldap ends here
