Extension { #name : #IceMethodContainerDefinition }

{ #category : #'*DeNigrisPreferences-GToolkit' }
IceMethodContainerDefinition >> target [
	| target |
	target := Smalltalk globals at: name.
	target isMeta ifTrue: [ target classSide ].
	^ target
]
