locations
preferencesFolder

	| generalPreferencesFolder |
	generalPreferencesFolder := self startupLoader default preferencesGeneralFolder.
	^ generalPreferencesFolder exists
		ifTrue: [ generalPreferencesFolder ]
		ifFalse: [ self usbRepositoryRoot parent / 'Preferences' ].