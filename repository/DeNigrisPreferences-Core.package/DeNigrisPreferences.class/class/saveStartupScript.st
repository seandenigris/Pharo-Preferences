utilities
saveStartupScript

	| onceAction everyStartupAction loadActionBlock loadAction showErrorsAction |
	loadActionBlock := [ 
		Gofer it
			directory: self repositoryDirectory fullName;
			package: 'DeNigrisPreferences-Core';
			load ].
	loadAction := StartupAction name: 'Load One-time Preferences' code: loadActionBlock runOnce: true.
	
	onceAction := StartupAction
		name: 'Load One-time Preferences'
		code: [ (Smalltalk at: #DeNigrisPreferences) instance loadOnce ]
		runOnce: true.
	
	everyStartupAction := StartupAction
		name: 'Load Preferences at every startup'
		code: [ (Smalltalk at: #DeNigrisPreferences) instance loadEachStartup ]
		runOnce: false.
		
	showErrorsAction := StartupAction
		name: 'Show any startup action errors'
		code: [ StartupLoader default errors ifNotEmpty: [ :errors | errors explore ] ]
		runOnce: false.
	
	self flag: 'notice in Pharo 2.0 if it saves with the correct line endings for the platform'.
	StartupLoader default addAtStartupForGeneral: { loadAction. onceAction. everyStartupAction. showErrorsAction }.