Extension { #name : #BaselineOf }

{ #category : #'*DeNigrisPreferences-Core' }
BaselineOf class >> beGToolkitAware [
	self 
		compile: (self class lookupSelector: #isGTImage) sourceCode
		classified: 'testing'.
	self 
		compile: (self class lookupSelector: #customProjectAttributes) sourceCode
		classified: 'accessing'.
	
]

{ #category : #'*DeNigrisPreferences-Core' }
BaselineOf class >> customProjectAttributes [

	^ self isGTImage
			ifTrue: [ #(GToolkit) ]
			ifFalse: [ #(notGToolkit) ].
			
	"This is just for code generation purposes. To have an effect, it needs to be on the instance-side, but that could hide problems in other baselines because DeNigrisPreferences is not guaranteed to be loaded"
]

{ #category : #'*DeNigrisPreferences-Core' }
BaselineOf class >> isGTImage [
	
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ].
	"Implementation note: used to check for GToolkit prefix, but P7 has a GToolkit-Examples package. Lepiter, OTOH, could only be loaded in a GT image"
]

{ #category : #'*DeNigrisPreferences-Core' }
BaselineOf class >> setUpIDE [
	"To use, a subclass should define class-side #dataFolder returning anAbstractFileReference"
	
	self isGTImage ifTrue: [ self setUpGToolkit ].

	"Epicea"
	OmSessionStore defaultBaseLocator: self dataFolder / 'ombu-sessions'.
	EpMonitor restart
]
