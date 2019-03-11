Extension { #name : #CompiledMethod }

{ #category : #'*DeNigrisPreferences-Core' }
CompiledMethod >> timeMethodLastSubmitted [
	"Answer a Date object indicating when a method was last submitted.  If there is no date stamp, return nil"
	"(CompiledMethod compiledMethodAt: #timeMethodLastSubmitted) timeMethodLastSubmitted"

	| aStamp tokens |
	aStamp := self timeStamp.
	tokens := aStamp findBetweenSubstrings: ' 
'.  "space is expected delimiter, but cr is sometimes seen, though of mysterious provenance"
	^ tokens size > 1
		ifTrue:
			[[tokens third asTime] ifError: [nil]]
		ifFalse:
			[nil]
]
