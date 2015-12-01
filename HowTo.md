Setup of project via Cocoapods `pod 'Jargon'`. It contains a commandline tool to sync/pull/push the translations.

It copies the strings to its own file `en.base.jargon`, in a json format (key : value).

* syncing (push, pull):

`Pods/Jargon/jargon sync -p .`

* pull Content

Specific locales can be specified:

`Pods/Jargon/jargon pullContent -p . -l fr`

* push Content

`Pods/Jargon/jargon pushContent -p .`
