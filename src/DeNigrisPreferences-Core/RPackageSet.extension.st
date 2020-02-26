Extension { #name : #RPackageSet }

{ #category : #'*DeNigrisPreferences-Core' }
RPackageSet >> resetCache [
	self instVarNamed: #definedClasses put: nil.
	self instVarNamed: #methods put: nil
]

{ #category : #'*DeNigrisPreferences-Core' }
RPackageSet class >> resetCacheFor: packageCollection [
	packageCollection do: [ :e | 
		| ps |
		ps := RPackageSet named: e packageName.
		ps resetCache ].
]

{ #category : #'*DeNigrisPreferences-Core' }
RPackageSet class >> resetCacheForBeginsWith: aString [
	| packages |
	packages := RPackageOrganizer default packages select: [ :e | e packageName beginsWith: aString ].
	self resetCacheFor: packages
]
