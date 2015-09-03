callbacks
loadOnce

	self log: 'Loading one-time startup script...'.
	StandardFonts setFontsToLarge.
	self fixIssue5656.
	self customizeCompletion.
	Debugger alwaysOpenFullDebugger: true.
	self useSharedCacheRepository.
	self setLocalRepositoryRoot.
	WorldState easySelectingWorld: true.
	Morph cycleHalosBothDirections: true.
	lastLoadOnce := thisContext method timeStamp.