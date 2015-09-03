as yet unclassified
execute

	usbCache isMounted ifFalse: [ self log: 'Skipping sync: USB not mounted' ].
	self laptopSharedCache exists ifFalse: [ self log: 'Skipping sync: not on home computer' ].
	self pushFromUSB.
	self pullFromHome.