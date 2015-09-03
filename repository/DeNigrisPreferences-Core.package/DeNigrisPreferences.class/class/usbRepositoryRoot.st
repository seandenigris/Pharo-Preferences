locations
usbRepositoryRoot

"	| isMac |
	isMac := FileLocator imageDirectory pathSegments first = 'Volumes'."
	^ FileLocator imageDirectory parent parent / 'Repositories'.