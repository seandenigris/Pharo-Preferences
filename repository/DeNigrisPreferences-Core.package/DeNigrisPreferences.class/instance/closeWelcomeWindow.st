actions
closeWelcomeWindow

	| welcomeWindows |
	welcomeWindows := World windowsSatisfying: [ :e | e title beginsWith: 'Welcome to Pharo' ].
	welcomeWindows do: [ :e | e delete ].