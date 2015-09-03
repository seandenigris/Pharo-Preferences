world menu
menuCommandOn: aBuilder 
	<worldMenu> 
	
	(aBuilder item: #Finder)
		action: [ Finder open ];
		parent: #MostUsedTools;
		help: 'Looking for something ?';
		icon: Finder icon.
		
	(aBuilder item: #RepoAuthentication)
		with: [
			(aBuilder item: #'ss')
				action: [ self instance logInToSqueakSource ].
			(aBuilder item: #'ss3')
				action: [ self instance logInToSqueakSource3 ].
			(aBuilder item: #'sthub')
				action: [ self instance logInToSmalltalkHub ] ].

	(aBuilder item: #Bootstraps)
		with: [
			(aBuilder item: #'SmallWorld')
				action: [ self instance loadSmallWorld ].
			(aBuilder item: #'DeNigrisSetup')
				action: [ self instance loadSetup ] ].
	(aBuilder item: #'Use LatAm Mirror')
				action: [ self instance useLatAmMirror ].
	(aBuilder item: #'IDE enhancements')
				action: [ self instance loadDevEnhancements ].
	(aBuilder item: #'Where Am I?')
				action: [ self instance informImageFolder ].