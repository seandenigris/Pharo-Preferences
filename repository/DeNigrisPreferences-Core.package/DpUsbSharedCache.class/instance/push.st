syncing
push
	"Poor man's UI: throw up an explorer on the unsynced files for review, and throw a halt in the sync code until the user has a chance to review them... the cobbler's children, eh..."

	| laptopFiles unsyncedFiles |
	laptopFiles := self laptopSharedCache files.
	unsyncedFiles := self folder files
		select: [ :usb | laptopFiles noneSatisfy: [ :lap | lap basename = usb basename ] ].
	unsyncedFiles explore.
	Halt now.
	unsyncedFiles do: [ :e | e copyTo: self laptopSharedCache / e basename ].