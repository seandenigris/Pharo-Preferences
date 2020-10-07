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
