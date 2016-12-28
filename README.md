---
layout: post
title: Trigger IFTTT From Emacs
---

IFTTT (If This Then That): [http://www.ifttt.com/] is a service which can interact with hundreds of services and devices
to take action on events.

## ifttt-trigger.el

IFTTT channels are the building blocks of IFTTT apps. For example,
there is a Twitter channel with events such as new tweet posted, and
actions such as post a tweet. For this package, we're interested in
the Maker channel, which offers the "receive web request" event. As the
 name suggests, this event triggers the specified action when a
 request is made to a special URL.

## Download and Install

Download the code from
<https://github.com/hadenpike/emacs-ifttt-trigger.git> and add the
following to your .emacs:

```
(add-to-list 'load-path "/path/to/ifttt-trigger.el")
(require 'ifttt-trigger)
```

## Configuration and Usage

This package allows you to trigger events made on the Maker
channel. So, head on over to [http://www.ifttt.com/] and create a new
app. For the "this" event, find the maker channel and select the
"receive web request" event. It'll ask you for an event name, which
can be anything you want, as long as you remember it. For the "that"
action, configure it as you like. Review the app and choose finish.

Now that that's done, IFTTT will give you instructions for obtaining
the secret key you use in your requests. Follow the instructions and
copy the key to the clipboard.

Back in Emacs, set the secret key with code like the following:
```
(setq ifttt-secret-key "<your-secret-key>")
```
replacing \<your-secret-key\> with the key you got from IFTTT. Now, try
```
M-x ifttt-trigger RET
```
and enter the name of the event you created on IFTTT. Or, call it in
Lisp:
```
(ifttt-trigger event-name)
```

Enjoy!

[http://www.ifttt.com/]: http://www.ifttt.com/
