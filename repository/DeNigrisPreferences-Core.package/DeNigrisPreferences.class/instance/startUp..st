startup/shutdown
startUp: newSession

	newSession ifFalse: [ ^ self ].
	self loadEachStartup.
	StartupLoader default errors ifNotEmpty: [ :errors | errors explore ].