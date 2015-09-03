StartupLoader default executeAtomicItems: {
        StartupAction name: 'Load Preferences Project' code: [
		"NBMacShell run: 'git clone git@github.com:seandenigris/PharoPreferences.git ''', FileLocator imageDirectory fullName, '/DeNigrisPreferences'''."
                Metacello new                       
			repository: 'filetree://', (FileLocator home / 'Dynabook/Repositories/DeNigrisPreferences/repository') fullName;
                        baseline: 'DeNigrisPreferences';
                        onConflict: [ :ex | ex allow ];
                        load.
	] runOnce: true.
        StartupAction name: 'Show any startup action errors' code: [ StartupPreferencesLoader default errors ifNotEmpty: [ :errors | errors explore ] ].
}.
