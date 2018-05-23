as yet unclassified
execute

	self areAllCachesAvailable ifFalse: [
		 self log: 'Skipping sync: not all caches available'.
		 ^ self ].
	self shouldPush ifTrue: [ self pushFromUSB ].
	self shouldPull ifTrue: [ self pullFromHome ].