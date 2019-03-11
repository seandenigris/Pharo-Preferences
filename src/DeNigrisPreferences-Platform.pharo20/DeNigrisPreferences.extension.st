Extension { #name : #DeNigrisPreferences }

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> addMyMetaRepoToConfigurationBrowser [
	"The available repos are hard-coded in Pharo 2.0. We could override the method, but I don't use Pharo 2.0, so..."
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
DeNigrisPreferences >> daytimeTheme [
	^ PharoTheme
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> debuggerClass [

	^ Debugger.
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> nighttimeTheme [
	^ self daytimeTheme
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences >> setFonts [

	StandardFonts setFontsToLarge
]

{ #category : #'*DeNigrisPreferences-Platform' }
DeNigrisPreferences class >> startupLoader [

	^ StartupLoader
]
