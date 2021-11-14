Extension { #name : #IceMethodDefinition }

{ #category : #'*DeNigrisPreferences-GToolkit' }
IceMethodDefinition >> target [
	| owner |
	owner := Smalltalk globals at: self className.
	self classIsMeta
		ifTrue: [ owner := owner classSide ].
	^ owner >> name
]
