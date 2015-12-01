Setup of project via Cocoapods `pod 'Jargon'`. It contains a commandline tool to sync/pull/push the translations.

It copies the strings to its own file `en.base.jargon`, in a json format (key : value).

* syncing (push, pull):

`Pods/Jargon/jargon sync -p .`

* pull Content

Specific locales can be specified:

`Pods/Jargon/jargon pullContent -p . -l fr`

* push Content

`Pods/Jargon/jargon pushContent -p .`

# Notes

After adding the french locale in the backend, translate the strings and pulling via the commandline, the downloaded file contains no translations. However, from the backend downloading the file does contain the strings. Trying to publishing the translations ends up with same result.

Moreover, `usejargon` downloads the translations at appstart, but if no connection should fall back to local ones.

When trying to launch the app on airplane mode, the storyboards default texts are replaced by their ids, which is even worst than having the wrong (default) language.


# Pros:

* Backend input of translation and batch commands (review...)

# Cons:

* Could not make it work properly
* Does not use default translations files
