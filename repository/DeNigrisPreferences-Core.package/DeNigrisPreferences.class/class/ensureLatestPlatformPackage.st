utilities
ensureLatestPlatformPackage

	| branchVersion branch |
	branchVersion := SystemVersion current majorMinor: ''.
	branch := 'pharo', branchVersion .
	self ensureLatest: self platformPackageName branch: branch ifAbsent: true.