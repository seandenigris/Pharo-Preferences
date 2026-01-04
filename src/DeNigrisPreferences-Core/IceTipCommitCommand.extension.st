Extension { #name : 'IceTipCommitCommand' }

{ #category : '*DeNigrisPreferences-Core' }
IceTipCommitCommand >> execute [

	"Still needed?
	RPackageSet resetCacheFor: self repositoryModel packages."

	(IceTipCommitBrowser 
		newApplication: context application 
		model: context workingCopyModel) 
		open
]
