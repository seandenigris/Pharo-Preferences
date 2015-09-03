class initialization
initialize

	self ensureLatestPlatformPackage.
	Smalltalk
		addToStartUpList: self;
		addToShutDownList: self.
	self instance loadEachStartup.