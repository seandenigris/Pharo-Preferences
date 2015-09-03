private
basicLoadEachStartup

	self log: 'Loading "each startup" script...'.

	Author fullName: 'SeanDeNigris'.
	
	"Set paths on each startup because they will be different if we are on a USB stick"
	self useSharedCacheRepository.
	self setLocalRepositoryRoot.

	self hasLoadOnceChanged  ifTrue: [ 
		self log: 'One-time startup script has changed...'.
		self loadOnce ].