*DeNigrisPreferences-Core
defaultBounds

	| bounds |
	bounds := Display usableArea.
	^ bounds right: bounds right * 1/3.