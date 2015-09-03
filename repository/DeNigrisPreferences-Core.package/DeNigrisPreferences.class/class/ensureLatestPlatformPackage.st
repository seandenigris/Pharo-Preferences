utilities
ensureLatestPlatformPackage

	| branchVersion branch latestPharoVersion |
	latestPharoVersion := 4. "The latest Pharo will be the reference version"
	SystemVersion current major asNumber = latestPharoVersion ifTrue: [ ^ self ].
	branchVersion := SystemVersion current majorMinor: ''.
	branch := 'pharo', branchVersion .
	self ensureLatest: self platformPackageName branch: branch ifAbsent: true.