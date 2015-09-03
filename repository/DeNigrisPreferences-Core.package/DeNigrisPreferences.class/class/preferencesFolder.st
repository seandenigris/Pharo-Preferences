accessing
preferencesFolder

	| generalPreferencesFolder |
	generalPreferencesFolder := StartupLoader default preferencesGeneralFolder.
	^ generalPreferencesFolder exists
		ifTrue: [ generalPreferencesFolder ]
		ifFalse: [ '/Volumes/NO NAME/Smalltalk/Preferences' asFileReference ].