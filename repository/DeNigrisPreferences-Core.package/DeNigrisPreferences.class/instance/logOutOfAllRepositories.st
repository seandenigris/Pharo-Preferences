repo authentication
logOutOfAllRepositories

	MCHttpRepository allSubInstancesDo: [ :e | e user: ''; password: '' ].