as yet unclassified
areAllCachesAvailable

	^ usbCache isMounted and: [ self laptopSharedCache exists ].