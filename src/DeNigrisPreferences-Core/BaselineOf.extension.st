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
BaselineOf class >> markdownComment [
	| generationNotice pillar |
	generationNotice := '""DISCLAIMER"": You are looking at a boring, dead export of living (i.e. dynamic) documentation. To view it in its natural habitat in all its glory, fire up a GToolkit image and check the class comment of ', self name.
	pillar := GtDocumenterParser parse: self comment, String crlf, generationNotice.
	^ PRMarkdownWriter write: pillar
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
