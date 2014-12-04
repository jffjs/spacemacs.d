(defvar ruby-packages
  '(
    rvm
    rspec-mode
    inf-ruby
    ))

(defun ruby/init-rvm ()
    (use-package rvm
      :init
      (progn
        (eval-after-load 'ruby-mode
          '(add-hook 'ruby-mode-hook
                     (lambda () (rvm-activate-corresponding-ruby)))))))

(defun ruby/init-rspec-mode ()
  (use-package rspec-mode
    :init
    (eval-after-load 'rvm
      '(progn
         (setq rspec-use-rvm t)
         (setq rspec-use-rake-when-possible nil)
         (defadvice rspec-compile (around rspec-compile-around)
           "Use BASH shell for running the specs because of ZSH issues."
           (let ((shell-file-name "/bin/bash"))
             ad-do-it))

         (ad-activate 'rspec-compile)

         (evil-leader/set-key-for-mode 'ruby-mode
           "mtv" 'rspec-verify
           "mts" 'rspec-verify-single
           "mtc" 'rspec-verify-continue
           "mtp" 'rspec-disable-example
           "mte" 'rspec-enable-example
           "mtf" 'rspec-find-spec-or-target-other-window))))

(defun ruby/init-inf-ruby ()
  (use-package inf-ruby
    :init
    (progn
      (eval-after-load 'ruby-mode
        '(evil-leader/set-key-for-mode 'ruby-mode
           "mcj" 'inf-ruby-console-auto
           "mcd" 'ruby-send-definition
           "mcr" 'ruby-send-region
           "mcb" 'ruby-send-block
           "mcz" 'ruby-switch-to-inf))
      (evil-leader/set-key-for-mode 'inf-ruby-mode
        "mcz" 'ruby-switch-to-last-ruby-buffer))))
