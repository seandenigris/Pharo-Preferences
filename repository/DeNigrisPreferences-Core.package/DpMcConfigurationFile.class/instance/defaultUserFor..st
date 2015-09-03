API-mc templates
defaultUserFor: repository

	repository baseURL asUrl host = 'smalltalkhub.com' ifTrue: [ self credentialsForSmalltalkHubDuring: [ :u :p | ^ u ] ].
	repository baseURL asUrl host = 'ss3.gemtalksystems.com' ifTrue: [ self credentialsForSqueakSource3During: [ :u :p | ^ u ] ].
	repository baseURL asUrl host = 'squeaksource.com' ifTrue: [ self credentialsForSqueakSourceDuring: [ :u :p | ^ u ] ].
	^ ''