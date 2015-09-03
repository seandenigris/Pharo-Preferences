API-mc templates
defaultPasswordFor: repository

	repository baseURL asUrl host = 'smalltalkhub.com' ifTrue: [ self credentialsForSmalltalkHubDuring: [ :u :p | ^ p ] ].
	repository baseURL asUrl host = 'ss3.gemtalksystems.com' ifTrue: [ self credentialsForSqueakSource3During: [ :u :p | ^ p ] ].
	repository baseURL asUrl host = 'squeaksource.com' ifTrue: [ self credentialsForSqueakSourceDuring: [ :u :p | ^ p ] ].
	^ ''