syncing
push
	"Poor man's UI: throw up an explorer on the unsynced files for review, and throw a halt in the sync code until the user has a chance to review them... the cobbler's children, eh..."

	| unsyncedFiles laptopMczFiles |
	Transcript show: 'about to find unsynced files'; cr.
	laptopMczFiles := self laptopMczFiles.
	unsyncedFiles := self usbMczFiles
		select: [ :usb | laptopMczFiles noneSatisfy: [ :lap | lap basename = usb basename ] ].
	Transcript show: 'found unsynced files'; cr.
	unsyncedFiles explore.
	Halt now.
	unsyncedFiles do: [ :e | e copyTo: self laptopSharedCache / e basename ].