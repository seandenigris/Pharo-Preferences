utilities
migrate: oldProjectName fromSqueakSourceToSmalltalkHubAs: newProjectName

	| source destination |
	
	self error: 'Moved to McProjectMigrate in Playground'.
	
	DpMcConfigurationFile new credentialsForSmalltalkHubDuring: [ :username :password |
		source := MCHttpRepository location: 'http://www.squeaksource.com/', oldProjectName.
		destination := MCSmalltalkhubRepository
		    owner: username
		    project: newProjectName
		    user: username
		    password: password ].

	#McProjectMigrate asClass new
		source: source;
		destination: destination;
		execute.