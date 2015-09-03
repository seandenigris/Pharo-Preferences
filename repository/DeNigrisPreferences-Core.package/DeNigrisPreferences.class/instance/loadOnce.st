callbacks
loadOnce

	self log: 'Loading one-time startup script...'.
	StandardFonts setFontsToLarge.
	self fixIssue5656.
	self customizeCompletion.
	self debuggerClass alwaysOpenFullDebugger: true.
	WorldState easySelectingWorld: true.
	Morph cycleHalosBothDirections: true.
	lastLoadOnce := thisContext method timeStamp.