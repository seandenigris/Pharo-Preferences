accessing
localRepositoryRoot
 
	| myRepositoryRoot |
	myRepositoryRoot := FileLocator home / 'Squeak/Repositories'.
	^ myRepositoryRoot exists
		ifTrue: [ myRepositoryRoot ]
		ifFalse: [ '/Volumes/NO NAME/Smalltalk/Repositories' asFileReference ]