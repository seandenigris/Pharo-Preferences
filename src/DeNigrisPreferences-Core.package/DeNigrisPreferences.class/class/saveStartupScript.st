utilities
saveStartupScript
	<script>

	| loadActionBlock loadAction showErrorsAction |
	self error: 'maybe broken'.
	loadActionBlock := [ 
		Gofer it
			smalltalkhubUser: 'SeanDeNigris' project: 'DeNigrisPreferences';
			package: 'DeNigrisPreferences-Core';
			load ].
	loadAction := StartupAction name: 'Load One-time Preferences' code: loadActionBlock runOnce: true.
		
	showErrorsAction := StartupAction
		name: 'Show any startup action errors'
		code: [ StartupPreferencesLoader default errors ifNotEmpty: [ :errors | errors explore ] ]
		runOnce: false.
	
	StartupPreferencesLoader default addAtStartupInGeneralPreferenceFolder: { loadAction. showErrorsAction }.