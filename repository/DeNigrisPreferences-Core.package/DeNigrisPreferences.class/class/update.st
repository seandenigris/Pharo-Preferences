utilities
update

	| dirtyPackage |
	dirtyPackage := MCWorkingCopy allInstances 
		detect: [ :e | (e packageName beginsWith: 'DeNigrisPreferences') and: [ e needsSaving ] ]
		ifNone: [ nil ].
	dirtyPackage ifNotNil: [ ^ self log: dirtyPackage packageName, ' has unsaved changes; not updating' ].
		
	Gofer it
		smalltalkhubUser: 'SeanDeNigris' project: 'DeNigrisPreferences';
		configurationOf: 'DeNigrisPreferences';
		loadDevelopment.
