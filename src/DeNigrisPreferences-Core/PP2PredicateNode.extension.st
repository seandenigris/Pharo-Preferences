Extension { #name : #PP2PredicateNode }

{ #category : #'*DeNigrisPreferences-Core' }
PP2PredicateNode class >> between: min and: max [
	^ self
		on: [ :each | each >= min and: [ each <= max ] ] message: min printString , '..' , max printString , ' expected'
]
