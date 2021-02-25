| loader |

loader := Smalltalk globals at: #StartupLoader ifAbsent: [ #StartupPreferencesLoader asClass ]. "StartupLoader deprecated in Pharo 5 - might as well keep compatibility for now (as of Pharo 6.1) to ease working with older images e.g. on archeological digs" 

loader default executeAtomicItems: {
        StartupAction name: 'Load Preferences Project' code: [
                Metacello new                       
                        baseline: 'DeNigrisPreferences';
			repository: 'github://seandenigris/Pharo-Preferences';
                        onConflict: [ :ex | ex allow ];
                        load.
	] runOnce: true.
        StartupAction name: 'Show any startup action errors' code: [ StartupPreferencesLoader default errors ifNotEmpty: [ :errors | errors explore ] ].
}.
