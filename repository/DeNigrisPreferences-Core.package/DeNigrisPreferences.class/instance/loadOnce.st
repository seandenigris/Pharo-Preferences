loading
loadOnce

	self log: 'Loading one-time startup script...'.
	self closeWelcomeWindow.
	StandardFonts setFontsToLarge.
	self customizeLauncherImageFolder.
	"self fixIssue5656."
	self customizeCompletion.
	self debuggerClass alwaysOpenFullDebugger: true.
	WorldState easySelectingWorld: true.
	Morph cycleHalosBothDirections: true.
	self addMyMcRepos.
	self loadProjectFromImageName.
	lastLoadOnce := thisContext method timeStamp.