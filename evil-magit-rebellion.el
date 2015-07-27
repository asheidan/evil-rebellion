;;; evil-magit-rebellion.el --- Key-bindings for evil magit rebels

;; Copyright © 2013-2014  Albert Krewinkel
;;
;; Author: Albert Krewinkel <albert+evil@zeitkraut.de>
;; Keywords: evil magit rebellion
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; This file is not part of GNU Emacs.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

;; Start to insert mode when editing commit messages
(evil-set-initial-state 'magit-log-edit-mode 'insert)
(evil-set-initial-state 'git-commit-mode 'insert)

(defun evil-magit-rebellion-quit-keymode ()
  (interactive)
  (magit-key-mode-command nil))

(evil-set-initial-state 'magit-commit-mode 'motion)
(evil-define-key 'motion magit-commit-mode-map
  "\C-c\C-b" 'magit-show-commit-backward
  "\C-c\C-f" 'magit-show-commit-forward)

(evil-set-initial-state 'magit-status-mode 'motion)
(evil-define-key 'motion magit-status-mode-map
  "\C-f" 'evil-scroll-page-down
  "\C-b" 'evil-scroll-page-up
  "." 'magit-mark-item
  "=" 'magit-diff-with-mark
  "C" 'magit-add-log
  "I" 'magit-ignore-item-locally
  "S" 'magit-stage-all
  "U" 'magit-unstage-all
  "X" 'magit-reset-working-tree
  "d" 'magit-discard
  "i" 'magit-ignore-item
  "s" 'magit-stage-item
  "u" 'magit-unstage-item
  "z" 'magit-key-mode-popup-stashing)

(evil-set-initial-state 'magit-log-mode 'motion)
(evil-define-key 'motion magit-log-mode-map
  "." 'magit-mark-item
  "=" 'magit-diff-with-mark
  "e" 'magit-log-show-more-entries)

(evil-set-initial-state 'magit-wassup-mode 'motion)
(evil-define-key 'motion magit-wazzup-mode-map
  "." 'magit-mark-item
  "=" 'magit-diff-with-mark
  "i" 'magit-ignore-item)

(evil-set-initial-state 'magit-branch-manager-mode 'motion)
(evil-define-key 'motion magit-branch-manager-mode-map
  "a" 'magit-add-remote
  "c" 'magit-rename-item
  "d" 'magit-discard
  "o" 'magit-create-branch
  "v" 'magit-show-branches
  "T" 'magit-change-what-branch-tracks)

;; "1" 'magit-show-level-1
;; "2" 'magit-show-level-2
;; "3" 'magit-show-level-3
;; "4" 'magit-show-level-4
(evil-set-initial-state 'magit-mode 'motion)
(evil-define-key 'motion magit-mode-map
  "\M-1" 'magit-show-level-1-all
  "\M-2" 'magit-show-level-2-all
  "\M-3" 'magit-show-level-3-all
  "\M-4" 'magit-show-level-4-all
  "\M-H" 'magit-show-only-files-all
  "\M-S" 'magit-show-level-4-all
  "\M-h" 'magit-show-only-files
  "\M-s" 'magit-show-level-4
  "!" 'magit-key-mode-popup-running
  "$" 'magit-process
  "+" 'magit-diff-more-context
  "-" 'magit-diff-less-context
  "=" 'magit-diff-default-context
  "/" 'evil-search-forward
  ":" 'evil-ex
  ";" 'magit-git-command
  "?" 'evil-search-backward
  "<" 'magit-stash-popup
  "A" 'magit-cherry-pick-item
  "B" 'magit-bisect-popup
  ;C  commit add log
  "D" 'magit-revert-item
  "E" 'magit-ediff
  "F" 'magit-pull-popup
  "G" 'evil-goto-line
  "H" 'magit-rebase-step
  ;I  ignore item locally
  "J" 'magit-key-mode-popup-apply-mailbox
  "K" 'magit-dispatch-popup
  "L" 'magit-add-change-log-entry
  "M" 'magit-remote-popup
  "N" 'evil-search-previous
  ;O  undefined
  "P" 'magit-push-popup
  ;Q  undefined
  "R" 'magit-refresh-all
  "S" 'magit-stage-all
  ;T  change what branch tracks
  "U" 'magit-unstage-all
  ;V  visual line
  "W" 'magit-diff-working-tree
  "X" 'magit-reset-working-tree
  "Y" 'magit-interactive-rebase
  "Z" 'magit-stash-popup
  "a" 'magit-apply-item
  "b" 'magit-branch-popup
  "c" 'magit-commit-popup
  ;d  discard
  "e" 'magit-diff
  "f" 'magit-fetch-popup
  "g?" 'magit-describe-item
  "g$" 'evil-end-of-visual-line
  "g0" 'evil-beginning-of-visual-line
  "gE" 'evil-backward-WORD-end
  "g^" 'evil-first-non-blank-of-visual-line
  "g_" 'evil-last-non-blank
  "gd" 'evil-goto-definition
  "ge" 'evil-backward-word-end
  "gg" 'evil-goto-first-line
  "gj" 'evil-next-visual-line
  "gk" 'evil-previous-visual-line
  "gm" 'evil-middle-of-visual-line
  "h" 'magit-key-mode-popup-rewriting
  ;i  ignore item
  "j" 'magit-section-forward
  "k" 'magit-section-backward
  "l" 'magit-log-popup
  "m" 'magit-merge-popup
  "n" 'evil-search-next
  "o" 'magit-submodule-popup
  "p" 'magit-cherry
  "q" 'magit-mode-bury-buffer
  "r" 'magit-refresh
  ;s  stage
  "t" 'magit-key-mode-popup-tagging
  ;u  unstage
  "v" 'magit-revert-item
  "w" 'magit-wazzup
  "x" 'magit-reset-head
  "y" 'magit-copy-item-as-kill
  ;z  position current line
  " " 'magit-show-item-or-scroll-up
  "\d" 'magit-show-item-or-scroll-down
  "\t" 'magit-section-toggle
  (kbd "<return>")   'magit-visit-item
  (kbd "C-<return>") 'magit-dired-jump
  (kbd "<backtab>")  'magit-section-toggle
  (kbd "C-x 4 a")    'magit-add-change-log-entry-other-window
  (kbd "\M-d") 'magit-copy-item-as-kill)

;; Symbol's value as variable is void: magit-rigid-key-bindings
;;
;; Redefine some bindings if rigid key bindings are expected
;; (when magit-rigid-key-bindings
;;   (evil-define-key 'motion magit-mode-map
;;     "!" 'magit-git-command-topdir
;;     "B" 'undefined
;;     "F" 'magit-pull
;;     "J" 'magit-apply-mailbox
;;     "M" 'magit-branch-manager
;;     "P" 'magit-push
;;     "b" 'magit-checkout
;;     "c" 'magit-commit
;;     "f" 'magit-fetch-current
;;     "h" 'undefined
;;     "l" 'magit-log
;;     "m" 'magit-merge
;;     "o" 'magit-submodule-update
;;     "t" 'magit-tag
;;     "z" 'magit-stash))

(evil-define-key 'motion magit-hunk-section-map
  "k" 'magit-section-backward)
(evil-define-key 'motion magit-file-section-map
  "k" 'magit-section-backward)
(evil-define-key 'motion magit-unstaged-section-map
  "k" 'magit-section-backward)
(evil-define-key 'motion magit-staged-section-map
  "k" 'magit-section-backward)
(evil-define-key 'motion magit-untracked-section-map
  "k" 'magit-section-backward)
(evil-define-key 'motion magit-branch-section-map
  "k" 'magit-section-backward)
(evil-define-key 'motion magit-remote-section-map
  "k" 'magit-section-backward)
(evil-define-key 'motion magit-tag-section-map
  "k" 'magit-section-backward)

(define-key magit-mode-map (kbd "k") #'magit-section-backward)
(define-key magit-hunk-section-map (kbd "k") #'magit-section-backward)
(define-key magit-file-section-map (kbd "k") #'magit-section-backward)
(define-key magit-unstaged-section-map (kbd "k") #'magit-section-backward)
(define-key magit-staged-section-map (kbd "k") #'magit-section-backward)
(define-key magit-untracked-section-map (kbd "k") #'magit-section-backward)
(define-key magit-branch-section-map (kbd "k") #'magit-section-backward)
(define-key magit-remote-section-map (kbd "k") #'magit-section-backward)
(define-key magit-tag-section-map (kbd "k") #'magit-section-backward)

(provide 'evil-magit-rebellion)
