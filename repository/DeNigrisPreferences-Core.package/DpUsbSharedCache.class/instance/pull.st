syncing
pull

	| laptopFiles unsyncedFiles usbFiles isMissingFromUSB |
	laptopFiles := self laptopSharedCache files.
	usbFiles := self folder files.
	isMissingFromUSB := [ :laptopFile | usbFiles noneSatisfy: [ :usb | laptopFile basename = usb basename ] ].

	unsyncedFiles := laptopFiles select: isMissingFromUSB.

	Halt now.

	[ :job |
		unsyncedFiles do: [ :e | 
			job increment.
			e copyTo: self folder / e basename ]
	] asJob
		max: unsyncedFiles size;
		run.
		