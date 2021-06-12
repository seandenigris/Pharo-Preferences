Extension { #name : #BaselineOf }

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> gtSetWindowTitles [
	| projectName |
	projectName := self name allButFirst: 'BaselineOf' size.
	GlutinWindowsRegistry default
		windowsDetailedTitleWithPrefix: projectName
		andSuffix: ''
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> gtViewLepiterOn: aView [
	<gtClassView>
	^ aView columnedList
		title: 'Lepiter' translated;
		priority: 80;
		items: [ self allSubclasses select: [ :e | e lepiterDatabaseFolder ifNil: [ false ] ifNotNil: [ :folder | folder exists ] ] ];
		column: 'Status' 
			icon: [ :aBaseline | 
				aBaseline lepiterDatabase 
					ifNil: [ BrGlamorousIcons redcircle ] 
					ifNotNil: [ aBaseline gitHasUnstaged 
						ifTrue: [ BrGlamorousIcons yellowcircle ] 
						ifFalse: [ BrGlamorousIcons greencircle ] ] ]
			width: 75;
		column: 'Name' text: [ :aBaseline | aBaseline name asRopedText ]
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> lepiterCommitDatabase [
	| repairCommand branch strategy checkout commitCommand |
	commitCommand := 'cd "' , self iceRepository location fullName
				, '"; git add lepiter/*; git commit -m lepiter-sync'.
	LibC system: commitCommand.
	
	repairCommand := IceTipCheckoutModel new.
	branch := (IceTipRepositoryModel on: self iceRepository) branchModel.
	strategy := checkout checkoutStrategies last.
	self assert: (strategy isKindOf: IceCheckoutDoNotLoadPackages).
	checkout
		checkoutStrategy: strategy;
		commitish: branch;
		diff;
		checkout
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> lepiterCreateDatabase [
	self lepiterDatabaseFolder ensureCreateDirectory.
	self lepiterLoadDatabase
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> lepiterDatabaseFolder [
	^ self iceRepository ifNotNil: [ :repo | repo location / 'lepiter' ].
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> lepiterLoadDatabase [
	| db |
	self lepiterDatabaseFolder exists ifFalse: [ ^ self ].
	db := LeLocalStoreLoad current loadAndMonitorFrom: self lepiterDatabaseFolder.
	LeDatabasesRegistry default defaultLogicalDatabase addDB: db
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> markdownComment [
	| generationNotice pillar |
	generationNotice := '""DISCLAIMER"": You are looking at a boring, dead export of living (i.e. dynamic) documentation. To view it in its natural habitat in all its glory, fire up a GToolkit image and check the class comment of ', self name.
	pillar := GtDocumenterParser parse: self comment, String crlf, generationNotice.
	^ PRMarkdownWriter write: pillar
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> setUpGToolkit [
	| projectName |
	self lepiterLoadDatabase.
	self gtSetWindowTitles.
]
