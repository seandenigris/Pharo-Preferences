loading
loadOnce

	self log: 'Loading one-time startup script...'.
	self configureIceberg.
	self closeWelcomeWindow.
	self setFonts.
	self configureFormatter.
	self customizeLauncher.
	self customizeCompletion.
	Smalltalk tools debugger alwaysOpenFullDebugger: true.
	WorldState easySelectingWorld: true.
	Morph cycleHalosBothDirections: true.
	self addMyMcRepos.
	self enableShortcutHelp.
	lastLoadOnce := thisContext method timeStamp.