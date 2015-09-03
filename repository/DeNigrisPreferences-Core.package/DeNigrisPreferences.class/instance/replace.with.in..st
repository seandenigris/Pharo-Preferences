utilities
replace: oldString with: newString in: file
	"self new replace: 'fred' with: 'BOB' in: 'myfile.txt'"

	| original newContents |
	original := file asFileReference readStreamDo: [ :in | in contents ].
	newContents := original copyReplaceAll: oldString with: newString.
	file asFileReference writeStreamDo: [ :out | out nextPutAll: newContents ].