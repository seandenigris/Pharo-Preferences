private
ensureLatest: packageName branch: branchString ifAbsent: aBoolean
	"Load latest version
		- if package is out-of-date
		- if package is absent and aBoolean = true"

	"Wait for package handling to stabilize in Pharo 2.0 before refactoring"
	| wc currentVersionNumber gofer shouldUpdate |
	shouldUpdate := false.
	gofer := Gofer it
			directory: self repositoryDirectory fullName.
	branchString isEmpty
		ifTrue: [ gofer package: packageName ]
		ifFalse: [ gofer package: packageName constraint: [ :version | version branch = branchString ] ].
	wc := MCWorkingCopy allInstances 
		detect: [ :e | e packageName = packageName ]
		ifNone: [ shouldUpdate := aBoolean. nil "Package not yet loaded" ].
	wc isNil ifFalse: [
		wc needsSaving ifTrue: [ ^ self log: packageName, ' has unsaved changes; not updating' ].
		currentVersionNumber := 	(wc ancestry ancestors first name copyAfterLast: $.) asNumber.
		shouldUpdate := gofer resolved first versionNumber > currentVersionNumber ].
	shouldUpdate ifTrue: [ gofer load ].