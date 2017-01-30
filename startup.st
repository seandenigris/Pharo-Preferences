| loader |

"StartupLoader deprecated in Pharo 5"
loader := Smalltalk globals at: #StartupLoader ifAbsent: [ #StartupPreferencesLoader asClass ].

loader default executeAtomicItems: {
        StartupAction name: 'Load Preferences Project' code: [
		repoFolder := FileLocator home / 'Dynabook' / 'Repositories' / 'DeNigrisPreferences'.
		repoFolder exists
			ifFalse: [ LibC system: 'git clone git@github.com:seandenigris/PharoPreferences.git ', repoFolder fullName surroundedBySingleQuotes ].
                Metacello new                       
			repository: 'filetree://', (repoFolder / 'repository') fullName;
                        baseline: 'DeNigrisPreferences';
                        onConflict: [ :ex | ex allow ];
                        load.
	] runOnce: true.
        StartupAction name: 'Show any startup action errors' code: [ StartupPreferencesLoader default errors ifNotEmpty: [ :errors | errors explore ] ].
}.
