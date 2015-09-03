project loading
loadSmallWorld

	| repo |
	repo := MCHttpRepository location: 'http://smalltalkhub.com/mc/SeanDeNigris/SmallWorld/main'.
	MCRepositoryGroup default addRepository: repo.
	DeNigrisPreferences new logInToSmalltalkHub.
	Gofer it
		smalltalkhubUser: 'SeanDeNigris' project: 'SeansVault';
		package: 'ConfigurationOfSmallWorld';
		load.
		
	#ConfigurationOfSmallWorld asClass project bleedingEdge load.