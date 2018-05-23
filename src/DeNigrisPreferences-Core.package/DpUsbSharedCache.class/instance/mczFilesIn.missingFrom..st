private
mczFilesIn: sourceDirectory missingFrom: destinationDirectory

	| sourceMczFiles sourceFileNames destinationMczFiles destinationFileNames unsyncedFileNames |
	"Compare the names instead of the actual files as an optimization, since the original version hang for a while and then crashed the VM"
	
	Transcript show: 'about to find unsynced files'; cr.
	sourceMczFiles := sourceDirectory filesMatching: '*.mcz'.
	sourceFileNames := sourceMczFiles collect: #basename.
	destinationMczFiles := destinationDirectory filesMatching: '*.mcz'.
	destinationFileNames := destinationMczFiles collect: #basename.
	unsyncedFileNames := sourceFileNames difference: destinationFileNames.
	Transcript show: 'found unsynced files'; cr.
	^ unsyncedFileNames sort collect: [ :e | sourceDirectory / e ].