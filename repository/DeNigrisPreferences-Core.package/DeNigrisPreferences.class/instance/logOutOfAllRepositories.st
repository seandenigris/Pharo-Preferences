utilities
logOutOfAllRepositories

	MCHttpRepository allSubInstancesDo: [ :e | e user: ''; password: '' ].