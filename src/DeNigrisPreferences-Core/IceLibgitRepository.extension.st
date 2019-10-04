Extension { #name : #IceLibgitRepository }

{ #category : #'*DeNigrisPreferences-Core' }
IceLibgitRepository class >> localRepositoriesLocation [
	^ FileLocator localDirectory / #iceberg
]
