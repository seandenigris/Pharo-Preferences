startup/shutdown
startUp: newSession
	newSession
		ifFalse: [ ^ self ].
	self loadEachStartup.
	self class startupLoader default errors
		ifNotEmpty: [ :errors | errors inspect ]