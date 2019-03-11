"
self uniqueInstance syncWithLaptop
"
Class {
	#name : #DpUsbSharedCache,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'DeNigrisPreferences-Core'
}

{ #category : #accessing }
DpUsbSharedCache class >> uniqueInstance [

	^ uniqueInstance ifNil: [ uniqueInstance := self new ].
]

{ #category : #accessing }
DpUsbSharedCache >> folder [
	^ DeNigrisPreferences usbRepositoryRoot / 'Shared Cache'
]

{ #category : #testing }
DpUsbSharedCache >> isMounted [

	^ self folder exists.
]

{ #category : #testing }
DpUsbSharedCache >> isMountedOnLaptop [

	^ self isMounted and: [ self laptopSharedCache exists ].
]

{ #category : #accessing }
DpUsbSharedCache >> laptopSharedCache [
	^ DeNigrisPreferences laptopRepositoryRoot asFileReference / 'Shared Cache'
]

{ #category : #private }
DpUsbSharedCache >> mczFilesIn: sourceDirectory missingFrom: destinationDirectory [

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
]

{ #category : #syncing }
DpUsbSharedCache >> pull [

	| unsyncedFiles |
	unsyncedFiles := self mczFilesIn: self laptopSharedCache missingFrom: self folder.
	self sync: unsyncedFiles to: self folder.
]

{ #category : #syncing }
DpUsbSharedCache >> push [
	"Poor man's UI: throw up an explorer on the unsynced files for review, and throw a halt in the sync code until the user has a chance to review them... the cobbler's children, eh..."

	| unsyncedFiles |
	unsyncedFiles := self mczFilesIn: self folder missingFrom: self laptopSharedCache.
	unsyncedFiles explore.
	Halt now.
	self sync: unsyncedFiles to: self laptopSharedCache.
]

{ #category : #private }
DpUsbSharedCache >> sync: files to: folder [

	[ :job |
		files do: [ :e | 
			job increment.
			e copyTo: folder / e basename ]
	] asJob
		max: files size;
		run.
		
]

{ #category : #syncing }
DpUsbSharedCache >> syncWithLaptop [

	self isMountedOnLaptop ifFalse: [ ^ self ].
	self
		pull;
		push.
]
