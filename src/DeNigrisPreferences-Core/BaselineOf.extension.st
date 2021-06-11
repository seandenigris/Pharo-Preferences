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
BaselineOf class >> setUpIDE [
	"To use, a subclass should define class-side #dataFolder returning anAbstractFileReference"
	
	self isGTImage ifTrue: [ self setUpGToolkit ].

	"Epicea"
	OmSessionStore defaultBaseLocator: self dataFolder / 'ombu-sessions'.
	EpMonitor restart
]
