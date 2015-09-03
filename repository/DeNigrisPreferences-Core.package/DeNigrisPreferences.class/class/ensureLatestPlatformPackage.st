utilities
ensureLatestPlatformPackage

	| branchVersion branch |
	branchVersion := SystemVersion current majorMinor: ''.
	branch := branchVersion = '30'
		ifTrue: [ 'pharo20' ] "There have been no changes for 3.0. Just use 2.0"
		ifFalse: [ 'pharo', branchVersion ].
	self ensureLatest: self platformPackageName branch: branch ifAbsent: true.