;;; ifttt-trigger.el --- Post IFTTT Events           -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Haden Pike

;; Author: Haden Pike <haden.pike@gmail.com>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; IFTTT (If This Then That)
;; http://www.ifttt.com/
;; is a service which can interact with hundreds of services and devices
;; to take action on events.
;; This package allows you to trigger events made on the Maker channel.

;;; Code:

(require 'url)

;;;###autoload
(defconst *ifttt-maker-url* "https://maker.ifttt.com/trigger/%s/with/key/%s"
  "IFTTT maker URL format.")

;;;###autoload
(defvar ifttt-secret-key nil
  "Your secret key to access the maker channel.")

;;;###autoload
(defun ifttt-url-post (url)
  "Make a POST request to url."
  (let ((url-request-method "POST"))
    (url-retrieve-synchronously url)))

;;;###autoload
(defun ifttt-trigger (event-name)
  "Trigger the action defined by making a POST request to the URL defined by event-name.

When called interactively, prompts for event name."
  (interactive (list (read-string "Event name: ")))
  (let ((emacspeak-speak-messages nil) ;; Suppresses automatic speaking for the duration of this function.
	(event-url (format *ifttt-maker-url* event-name ifttt-secret-key)))
    (ifttt-url-post event-url)))

(provide 'ifttt-trigger)
;;; ifttt-trigger.el ends here
