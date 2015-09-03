class initialization
initialize

	Smalltalk
		addToStartUpList: self;
		addToShutDownList: self.
	self instance loadEachStartup