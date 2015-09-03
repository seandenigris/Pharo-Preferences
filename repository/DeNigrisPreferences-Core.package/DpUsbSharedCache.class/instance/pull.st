syncing
pull

	| unsyncedFiles usbFiles isMissingFromUSB |
	usbFiles := self folder files.
	isMissingFromUSB := [ :laptopFile | usbFiles noneSatisfy: [ :usb | laptopFile basename = usb basename ] ].

	unsyncedFiles := self laptopMczFiles select: isMissingFromUSB.

	[ :job |
		unsyncedFiles do: [ :e | 
			job increment.
			e copyTo: self folder / e basename ]
	] asJob
		max: unsyncedFiles size;
		run.
		