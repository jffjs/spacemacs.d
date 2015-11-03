(defvar svn-packages
  '(
    dsvn
    ))

(defun svn/init-dsvn ()
  (use-package dsvn
    :init
    (progn
      (add-to-list 'evil-emacs-state-modes 'svn-status-mode)
      (evil-leader/set-key
        "ghs" 'svn-status))))
