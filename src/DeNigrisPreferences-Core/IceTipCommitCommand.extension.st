Extension { #name : #IceTipCommitCommand }

{ #category : #'*DeNigrisPreferences-Core' }
IceTipCommitCommand >> execute [
	RPackageSet resetCacheFor: self repositoryModel realObject packages.
	(IceTipCommitBrowser on: self repositoryModel) open
]
