The following is mostly always needed when you translate your app on iOS:

1. Add Localize resources (project>Localizations)
2. Use NSLocalizedString
3. run genstrings to generate the .strings files: `find ./translations -name \*.swift | xargs genstrings -o translations/en.lproj`
4. Translate!