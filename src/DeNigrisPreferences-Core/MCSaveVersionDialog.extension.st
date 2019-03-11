Extension { #name : #MCSaveVersionDialog }

{ #category : #'*DeNigrisPreferences-Core' }
MCSaveVersionDialog >> defaultBounds [

	| bounds |
	bounds := Display usableArea.
	^ bounds right: bounds right * 1/3.
]

{ #category : #'*DeNigrisPreferences-Core' }
MCSaveVersionDialog >> showModally [
	|  |
	modal := true.
	self window
		openInWorld;
		bounds: self defaultBounds.
	self setDefaultFocus.
	[ self window world notNil ] whileTrue: [ self window outermostWorldMorph doOneCycle ].
	morph := nil.
	^ modalValue
]
