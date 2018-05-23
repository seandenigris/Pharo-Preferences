locations
usbRepositoryRoot

"	| isMac |
	isMac := FileLocator imageDirectory pathSegments first = 'Volumes'."
	^ '/Volumes/SEAN/Smalltalk/Repositories' asFileReference.