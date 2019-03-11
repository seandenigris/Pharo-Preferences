"
Actually syncs the entire Repository folder, not just the shared cache; as well as the Reference folder.

self new
"" following both true by default:
	shouldPush: false;
	shouldPull: false;""
	execute.
"
Class {
	#name : #DpSyncSharedCaches,
	#superclass : #Object,
	#instVars : [
		'usbCache',
		'shouldPush',
		'shouldPull'
	],
	#classInstVars : [
		'usbCache'
	],
	#category : 'DeNigrisPreferences-Core'
}

{ #category : #'as yet unclassified' }
DpSyncSharedCaches >> areAllCachesAvailable [

	^ usbCache isMounted and: [ self laptopSharedCache exists ].
]

{ #category : #'as yet unclassified' }
DpSyncSharedCaches >> execute [

	self areAllCachesAvailable ifFalse: [
		 self log: 'Skipping sync: not all caches available'.
		 ^ self ].
	self shouldPush ifTrue: [ self pushFromUSB ].
	self shouldPull ifTrue: [ self pullFromHome ].
]

{ #category : #'as yet unclassified' }
DpSyncSharedCaches >> initialize [
	super initialize.
	usbCache := DpUsbSharedCache new.
	shouldPush := shouldPull := true.
]

{ #category : #private }
DpSyncSharedCaches >> laptopReferenceFolder [
	^ '/Users/sean/Squeak/Reference' asFileReference.
]

{ #category : #private }
DpSyncSharedCaches >> laptopRepositoryRoot [
	^ self laptopSharedCache parent
]

{ #category : #'as yet unclassified' }
DpSyncSharedCaches >> laptopSharedCache [

	^ DeNigrisPreferences laptopRepositoryRoot asFileReference / 'Shared Cache'
]

{ #category : #private }
DpSyncSharedCaches >> pullFromHome [

	self syncFrom: self laptopRepositoryRoot to: self usbRepositoryRoot.
	self syncFrom: self laptopReferenceFolder to: self usbReferenceFolder
]

{ #category : #private }
DpSyncSharedCaches >> pushFromUSB [

	self syncFrom: self usbRepositoryRoot to: self laptopRepositoryRoot.
	self syncFrom: self usbReferenceFolder to: self laptopReferenceFolder.
]

{ #category : #accessing }
DpSyncSharedCaches >> shouldPull [
	^ shouldPull
]

{ #category : #accessing }
DpSyncSharedCaches >> shouldPull: anObject [
	shouldPull := anObject
]

{ #category : #accessing }
DpSyncSharedCaches >> shouldPush [
	^ shouldPush
]

{ #category : #accessing }
DpSyncSharedCaches >> shouldPush: anObject [
	shouldPush := anObject
]

{ #category : #private }
DpSyncSharedCaches >> syncFrom: sourceFolder to: targetFolder [ 

	| commandTemplate command |
	self flag: '#per Fundamentals: should be sourceFolder syncTo: targetFolder because there are no self sends'.
	"
	- Don't update existing files because mcz files should never be altered (--ignore-existing)
	- Ignore Mac hidden files i.e. starting with $. (--exclude=.*)
	- Recursive (-r)
	- Preserve meta-data (-a = archive)
	- Verbose (-v)
	- Compress during transfer (-z)"
	commandTemplate := '/usr/bin/rsync -ravz --ignore-existing --exclude=".DS_Store" --exclude="._*" "{1}" "{2}"'.
	command := commandTemplate format: { sourceFolder fullNameWithIndicator. targetFolder fullName }.
	DeNigrisPreferences run: command.
]

{ #category : #private }
DpSyncSharedCaches >> usbReferenceFolder [
	^ self usbRepositoryRoot parent / 'Reference'
]

{ #category : #private }
DpSyncSharedCaches >> usbRepositoryRoot [
	^ usbCache folder parent
]
