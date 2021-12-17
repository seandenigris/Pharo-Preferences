Extension { #name : #BaselineOf }

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> gtSetWindowTitles [
	| projectName |
	projectName := self name allButFirst: 'BaselineOf' size.
	GlutinWindowsRegistry default
		windowsDetailedTitleWithPrefix: projectName
		andSuffix: ''
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> setUpGToolkit [
	| projectName |
	
	"Workaround for https://github.com/feenkcom/gtoolkit/issues/2115"
	RPackage organizer unregisterPackageNamed: 'TonelFixes'.
	
	self lepiter databases do: #load.
	self gtSetWindowTitles.
]
