Here's the steps followed to integrate App Langua:

1. Sign up
2. Integrate SDK via cocoapods `pod 'Applanga'`
3. Add the applanga settings to your target.

Running the App will automatically upload all strings that should be localized (storyboard). It uploads all strings shown/processed on runtime.

# Pros

* Easy and quick to integrate (1 min)
* Supports dynamic texts in NSLocalizedString
* Translation flexibility : you can translate yourself/ with team members or
* Add screenshot feature
* Supports Xliff, import/export

# Cons

* When uploaded first time for base language, you cannot use the key as translation automatically.
* Batch functions disabled (Approved)
* Screenshot not taken and uploaded automatically
* Does not update the values from localized.strings to backend
* Cannot search for translations or sort.

-> Will always take the translation from backend, which could be confusing in the code based if translations shown are not the same from .strings/ source code. Hopefully importing the the latest translations (Xliff) to Xcode project solves the issue.
