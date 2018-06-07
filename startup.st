| loader |

"StartupLoader deprecated in Pharo 5 - might as well keep compatibility for now (as of Pharo 6.1) to ease working with older images e.g. on archeological digs"
loader := Smalltalk globals at: #StartupLoader ifAbsent: [ #StartupPreferencesLoader asClass ].

loader default executeAtomicItems: {
        StartupAction name: 'Load Preferences Project' code: [
		repoFolder := FileLocator home / 'Dynabook' / 'Repositories' / 'DeNigris-Preferences'.
		repoFolder exists
			ifFalse: [ LibC system: 'git clone git@github.com:seandenigris/Pharo-Preferences.git ', repoFolder fullName surroundedBySingleQuotes ].
                Metacello new                       
			repository: 'filetree://', (repoFolder / 'src') fullName;
                        baseline: 'DeNigrisPreferences';
                        onConflict: [ :ex | ex allow ];
                        load.
	] runOnce: true.
        StartupAction name: 'Show any startup action errors' code: [ StartupPreferencesLoader default errors ifNotEmpty: [ :errors | errors explore ] ].
}.
