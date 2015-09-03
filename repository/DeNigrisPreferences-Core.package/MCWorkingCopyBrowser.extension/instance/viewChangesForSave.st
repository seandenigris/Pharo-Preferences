*DeNigrisPreferences-Core
viewChangesForSave

	| currentWindow bounds |
	currentWindow := World currentWindow.
	self viewChanges.
	[ currentWindow == World currentWindow ] whileTrue: [ 100 milliSeconds asDelay wait ].
	bounds := Display usableArea left: Display usableArea width * 1/3.
	World currentWindow bounds: bounds.