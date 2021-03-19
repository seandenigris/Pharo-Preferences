Extension { #name : #BaselineOf }

{ #category : #'*DeNigrisPreferences-Core' }
BaselineOf class >> beGToolkitAware [
	self compile: 'isGTImage
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: ''GToolkit-'' ]' classified: 'testing'.
	self compile: 'customProjectAttributes
	^ self isGTImage
			ifFalse: [ #() ]
			ifTrue: [ #(GToolkit) ]' classified: 'accessing'.
	
]

{ #category : #'*DeNigrisPreferences-Core' }
BaselineOf class >> isGTImage [
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'GToolkit-' ]
]

{ #category : #'*DeNigrisPreferences-Core' }
BaselineOf class >> setUpGToolkit [
	
	"Old-style GT locations"
	| projectName |
	GTPlayBook
		cacheDirectory: (self dataFolder / 'play-cache') ensureCreateDirectory;
		stashDirectory: (self dataFolder / 'play-stash') ensureCreateDirectory.

	"Gtoolkit locations"
	Smalltalk globals
		at: #XdPlaygroundSettings
		ifPresent: [ :cls | cls directory: (self dataFolder / 'xdocs') ensureCreateDirectory ].
		
	"Window Title(s)"
	projectName := self name allButFirst: 'BaselineOf' size.
	GlutinWindowsRegistry default windowsDetailedTitleWithPrefix: projectName andSuffix: ''
]

{ #category : #'*DeNigrisPreferences-Core' }
BaselineOf class >> setUpIDE [
	"To use, a subclass should define class-side #dataFolder returning anAbstractFileReference"
	
	self isGTImage ifTrue: [ self setUpGToolkit ].

	"Epicea"
	OmSessionStore defaultBaseLocator: self dataFolder / 'ombu-sessions'.
	EpMonitor restart
]
