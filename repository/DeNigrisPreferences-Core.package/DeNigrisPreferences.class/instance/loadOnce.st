loading
loadOnce

	self log: 'Loading one-time startup script...'.
	self closeWelcomeWindow.
	self setFonts.
	self configureFormatter.
	self customizeLauncher.
	self customizeCompletion.
	self debuggerClass alwaysOpenFullDebugger: true.
	WorldState easySelectingWorld: true.
	Morph cycleHalosBothDirections: true.
	self addMyMcRepos.
	self enableShortcutHelp.
	lastLoadOnce := thisContext method timeStamp.