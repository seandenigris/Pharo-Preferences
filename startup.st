| loader |
loader := Smalltalk globals at: #StartupLoader ifAbsent: [ #StartupPreferencesLoader asClass ].
loader default executeAtomicItems: {
	StartupAction name: 'Load DeNigrisPreferences' code: [
		Gofer it 
			url: 'http://smalltalkhub.com/mc/SeanDeNigris/DeNigrisPreferences/main';
			package: 'DeNigrisPreferences-Core';
			load.
] runOnce: true }.
