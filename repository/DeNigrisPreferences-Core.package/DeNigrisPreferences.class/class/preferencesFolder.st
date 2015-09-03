locations
preferencesFolder

	| generalPreferencesFolder |
	generalPreferencesFolder := StartupLoader default preferencesGeneralFolder.
	^ generalPreferencesFolder exists
		ifTrue: [ generalPreferencesFolder ]
		ifFalse: [ self usbRepositoryRoot parent / 'Preferences' ].