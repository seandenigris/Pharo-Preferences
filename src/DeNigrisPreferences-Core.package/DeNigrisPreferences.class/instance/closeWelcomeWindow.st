actions
closeWelcomeWindow

	| welcomeWindows |
	welcomeWindows := World windowsSatisfying: [ :e | e label beginsWith: 'Welcome to Pharo' ].
	welcomeWindows do: [ :e | e delete ].