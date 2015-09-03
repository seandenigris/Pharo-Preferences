utilities
addMyMetaRepo

	MCRepositoryGroup default addRepository: (MCHttpRepository location: self myMetaRepoUrl asString).
	self addMyMetaRepoToConfigurationBrowser.