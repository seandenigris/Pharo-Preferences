accessing
localRepositoryRoot
 
	^ self laptopRepositoryRoot exists
		ifTrue: [ self laptopRepositoryRoot ]
		ifFalse: [ self usbRepositoryRoot ].