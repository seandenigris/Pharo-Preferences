Extension { #name : #DeNigrisPreferences }

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> addMyMetaRepoToConfigurationBrowser [
	"In Pharo 3.0, the repository list is not configurable (implemented in Pharo 4)."
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
		smartCharactersWithDoubleSpace: '[]{}';
		spaceAfterCompletion: false;
		popupAutomaticDelay: 100.
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> debuggerClass [

	^ SpecDebugger.
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> nighttimeTheme [

	^ Pharo3Theme
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
	SourceCodeFonts setSourceCodeFonts: SourceCodeFonts sizeLarge
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences class >> startupLoader [

	^ StartupLoader
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> updateTheme [
	"We'll keep the default theme on Pharo 3.0"
]
