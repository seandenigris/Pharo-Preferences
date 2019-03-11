Class {
	#name : #DeNigrisPreferencesTests,
	#superclass : #TestCase,
	#category : 'DeNigrisPreferences-Core-Tests'
}

{ #category : #tests }
DeNigrisPreferencesTests >> testIsLauncherImage [
	"Mindless test to get Travis passing"

	self assert: (DeNigrisPreferences new isLauncherImage isKindOf: Boolean).
]
