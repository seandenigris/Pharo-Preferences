*DeNigrisPreferences-Core
logMessage
	^ message
		ifNil: [ | isSlice |
			isSlice := self versionName beginsWith: 'SLICE'.
			isSlice
				ifFalse: [ 'empty log message' ]
				ifTrue: [ | issueNumber |
					issueNumber := (self versionName allButFirst: MCSliceInfo namePrefix size) asNumber.
					(PharoIssue number: issueNumber) sliceCommitMessageBoilerplate ] ]