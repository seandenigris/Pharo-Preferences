private
basicLoadEachStartup

	self log: 'Loading "each startup" script...'.

	Author fullName: 'SeanDeNigris'.

	self hasLoadOnceChanged  ifTrue: [ 
		self log: 'One-time startup script has changed...'.
		self loadOnce ].