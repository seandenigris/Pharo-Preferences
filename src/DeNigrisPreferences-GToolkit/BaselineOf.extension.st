Extension { #name : #BaselineOf }

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> addLepiterDatabase [
	| lepiterFolder db |
	lepiterFolder := self iceRepository location / 'lepiter'.
	lepiterFolder exists ifFalse: [ ^ self ].
	db := LeLocalStoreLoad current loadAndMonitorFrom: lepiterFolder.
	LeDatabasesRegistry default defaultLogicalDatabase addDB: db
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> gtSetWindowTitles [
	| projectName |
	projectName := self name allButFirst: 'BaselineOf' size.
	GlutinWindowsRegistry default
		windowsDetailedTitleWithPrefix: projectName
		andSuffix: ''
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> setUpGToolkit [
	| projectName |
	self addLepiterDatabase.
	self gtSetWindowTitles.
]
