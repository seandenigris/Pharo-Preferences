private-loading
basicLoadEachStartup

	self log: 'Loading "each startup" script...'.

	Author fullName: 'SeanDeNigris'.
	
	"Set paths on each startup because they will be different if we are on a USB stick"
	self useSharedCacheRepository.
	self setLocalRepositoryRoot.
	
	self updateTheme.
	self confirmCorrectVM.
"	self syncSharedCaches."
	self setMcConfigurationFolder.

	self hasLoadOnceChanged  ifTrue: [ 
		self log: 'Latest version of load-once script has never been run...'.
		self loadOnce ].