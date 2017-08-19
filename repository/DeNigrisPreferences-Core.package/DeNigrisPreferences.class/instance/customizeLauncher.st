Launcher
customizeLauncher

	self isLauncherImage ifFalse: [ ^ self ].
	
	self setLauncherImageDirectory.
	self loadSmallWorld