Extension { #name : #IceTipCommitCommand }

{ #category : #'*DeNigrisPreferences-Core' }
IceTipCommitCommand >> execute [

	self repositoryModel realObject packages do: [ :p |
		| rp |
		rp := RPackageSet named: p packageName.
		rp instVarNamed: #definedClasses put: nil.
		rp instVarNamed: #methods put: nil. ].
	(IceTipCommitBrowser on: self repositoryModel) openWithSpec
]
