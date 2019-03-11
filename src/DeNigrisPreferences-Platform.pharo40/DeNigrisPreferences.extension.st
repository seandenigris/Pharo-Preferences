Extension { #name : #DeNigrisPreferences }

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> addMyMetaRepoToConfigurationBrowser [

	MetacelloConfigurationBrowserPane availableRepositories add: self myMetaRepoUrl asString
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> changesetSnippets [
	"Until Bug 12278 is fixed in 3.0"
	
	ChangeSorterModel.
	ChangeSet newChangeSet.
	ChangeSet newChanges: (ChangeSet named: '').
	(ChangeSet named: 'Unnamed') assimilateAllChangesFoundIn: (ChangeSet named: '').
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> customizeCompletion [

	NECPreferences
		enabled: true;
		caseSensitive: true;
		expandPrefixes: true;
		useEnterToAccept: false;
		smartCharacters: true;
		smartCharactersWithDoubleSpace: '[]{}||';
		spaceAfterCompletion: false;
		popupAutomaticDelay: 100.
	NECPreferences smartCharactersMapping at: $| put: $|
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> daytimeTheme [

	^ Pharo3Theme
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> debuggerClass [

	^ SpecDebugger.
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> enableShortcutHelp [
	"Not available in Pharo 4.0"
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> nighttimeTheme [

	^ Pharo3DarkTheme
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> refreshPackageNamed: aString [

	| package |
	package := RPackageOrganizer default packageNamed: aString.
	package
		forceRefreshClassDefinedSelectors;
		forceRefreshMetaclassDefinedSelectors.
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> setFonts [
	^ SourceCodeFonts setSourceCodeFonts: SourceCodeFonts sizeLarge.
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences class >> startupLoader [

	^ StartupLoader
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> updateTheme [
	"Try out the Dark Theme for now..."
	"(Time now between: '7:00am' asTime and: '9:00pm' asTime)
		ifTrue: [ self daytimeTheme installFullTheme ]
		ifFalse: [" self nighttimeTheme installFullTheme "]"
]
