utilities
ensureLatestPlatformPackage

	| branchVersion branch |
	"We used to have no Platform package for latest Pharo, which was treated as the reference implementation. Then... a feature (editable meta repo list in MetaConfig Browser) was added in Pharo 4.0. So from preferences, we want to configure this. How to proceed? If we write the method in DeNP-Core, we will have to override it in older versions as a no-op to avoid a DNU. Unless we add the sent messages as no-ops all the way down the rabbit hole. Interesting, but seems like it might be overly cute, and what do we save because we'll most likely have a Platform package for 4.0 as soon as 5.0 comes out anyway!"
	branchVersion := SystemVersion current majorMinor: ''.
	branch := 'pharo', branchVersion .
	self ensureLatest: self platformPackageName branch: branch ifAbsent: true.