Launcher
customizeLauncher

	self isLauncherImage ifFalse: [ ^ self ].
	
	self setLauncherImageDirectory.
	PhLLaunchImageCommand warnOnArchMismatch: false. "Warns about 322-bit lib dependency on Linux"
	self loadSmallWorld.