*DeNigrisPreferences-Core
showModally
	|  |
	modal := true.
	self window
		openInWorld;
		bounds: self defaultBounds.
	self setDefaultFocus.
	[ self window world notNil ] whileTrue: [ self window outermostWorldMorph doOneCycle ].
	morph := nil.
	^ modalValue