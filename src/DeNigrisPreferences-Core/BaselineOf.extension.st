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
BaselineOf class >> gitHasUnstaged [
	| unstagedCmd cmd exitCodeString |
	"Adapted from https://stackoverflow.com/a/5139672"
	unstagedCmd := 'git diff --quiet --exit-code; echo $?'.
	cmd := 'cd "' , self iceRepository location fullName , '"; ', unstagedCmd.
	exitCodeString := LibC resultOfCommand: cmd.
	^ exitCodeString trimRight asNumber = 1
]

{ #category : #'*DeNigrisPreferences-Core' }
BaselineOf class >> isGTImage [
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'GToolkit-' ]
]

{ #category : #'*DeNigrisPreferences-Core' }
BaselineOf class >> lepiterAllUnstaged [
	| baselinesWithDBs |
	
	^ self allSubclasses select: [ :e | e lepiterDatabase isNotNil and: [ e gitHasUnstaged ] ].
]

{ #category : #'*DeNigrisPreferences-Core' }
BaselineOf class >> setUpIDE [
	"To use, a subclass should define class-side #dataFolder returning anAbstractFileReference"
	
	self isGTImage ifTrue: [ self setUpGToolkit ].

	"Epicea"
	OmSessionStore defaultBaseLocator: self dataFolder / 'ombu-sessions'.
	EpMonitor restart
]
