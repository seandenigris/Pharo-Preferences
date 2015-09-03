MC
addMyMcRepos

	| urls |
	urls := { self myMetaRepoUrl. self myOutboxRepoUrl. self myPlaygroundRepoUrl }.
	urls do: [ :url | | repo |
		repo := MCHttpRepository location: url asString.
		MCRepositoryGroup default addRepository: repo ].
	self
		logInToSqueakSource;
		logInToSqueakSource3;
		logInToSmalltalkHub.
	
	self addMyMetaRepoToConfigurationBrowser.