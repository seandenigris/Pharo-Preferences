*DeNigrisPreferences-Core
sliceCommitMessageBoilerplate

	^ String streamContents: [ :str |
		str
			nextPutAll: self creationNotification;
			cr; cr;
			nextPutAll: '#### This version:'; cr;
			nextPutAll: self changesFromSliceCommitMessage
		]