as yet unclassified
recordCurrent
	"declare the list of currently loaded packages as Core for this software update"

	| savedPackageNames updateNumber source sortedPackageNames |
	updateNumber := SystemVersion current highestUpdate asString.
	savedPackageNames := MCPackage allInstances asSet select: [ :e | e workingCopy ancestors isEmpty not and: [ (e name beginsWith: 'DeNigrisPreferences') not ] ] thenCollect: [ :e | e workingCopy currentVersionInfo name ].
	sortedPackageNames := savedPackageNames asOrderedCollection sort.
	Halt now.
	source := String streamContents: [ :str |
		str
			nextPutAll: 'forUpdate';
			nextPutAll: updateNumber asString;
			cr;
			cr;
			tab;
			nextPutAll: '#(';
			cr;
			tab;
			tab.
		sortedPackageNames sort
			do: [ :e | str nextPutAll: e surroundedBySingleQuotes ]
			separatedBy: [ str cr; tab; tab ].
		str
			cr;
			tab;
			nextPutAll: ')'. ].
	self class compile: source classified: 'updates'.