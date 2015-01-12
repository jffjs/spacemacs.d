(defvar clojure-packages
  '(
    clojure-mode
    cider
    ))

(defun clojure/init-clojure-mode ()
  (use-package clojure-mode
    :init
    (progn
      (defun clojure-mode-defaults ()
        (subword-mode +1)
        (smartparens-strict-mode +1)
        (rainbow-delimiters-mode +1))

      (add-hook 'clojure-mode-hook 'clojure-mode-defaults)
      (add-hook 'clojure-mode-hook 'evil-lisp-state)

      (eval-after-load 'clojure-mode
        '(progn
           (defadvice eval-last-sexp (around clj-eval-last-sexp activate)
             (if (eq major-mode 'clojure-mode) (cider-eval-last-sexp)
               ad-do-it))
           (defadvice eval-defun (around clj-eval-defun activate)
             (if (eq major-mode 'clojure-mode) (cider-eval-defun-at-point)
               ad-do-it))))

      (evil-leader/set-key-for-mode 'clojure-mode
        "ml" 'evil-lisp-state
        "mz" 'cider-switch-to-repl-buffer
        "mcj" 'cider-jack-in
        "mcc" 'cider-connect
        "mcq" 'cider-quit
        "mck" 'cider-load-buffer
        "mcl" 'cider-load-file
        "mcn" 'cider-repl-set-ns
        "mdd" 'cider-doc
        "mdg" 'cider-grimoire
        "mda" 'cider-apropos
        "mgv" 'cider-jump-to-var
        "mgr" 'cider-jump-to-resource
        "mge" 'cider-jump-to-compilation-error
        "mgs" 'cider-jump
        "mtt" 'cider-test-run-tests)

      )))

(defun clojure/init-cider ()
  (use-package cider
    :init
    (progn
      (defun cider-repl-mode-defaults ()
        (smartparens-strict-mode +1)
        (rainbow-delimiters-mode +1)
        (whitespace-mode -1))

      (setq nrepl-log-messages t)
      (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
      (add-hook 'cider-repl-mode-hook 'cider-repl-mode-defaults)

      (evil-leader/set-key-for-mode 'cider-repl-mode
        "ml" 'evil-lisp-state
        "mz" 'cider-switch-to-last-clojure-buffer
        "mcq" 'cider-quit))))
