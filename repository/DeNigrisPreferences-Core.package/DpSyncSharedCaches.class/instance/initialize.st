as yet unclassified
initialize
	super initialize.
	usbCache := DpUsbSharedCache new.
	shouldPush := shouldPull := true.