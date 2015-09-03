testing
isMountedOnLaptop

	^ self isMounted and: [ self laptopSharedCache exists ].