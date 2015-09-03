syncing
syncWithLaptop

	self isMountedOnLaptop ifFalse: [ ^ self ].
	self pull.
	self push.