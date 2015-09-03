StartupLoader default executeAtomicItems: {
        StartupAction name: 'Load Preferences Project' code: [
                Metacello new                        repository: 'filetree://', (FileLocator home / 'Dynabook/Repositories/DeNigrisPreferences/repository') fullName;
                        baseline: 'DeNigrisPreferences';
                        onConflict: [ :ex | ex allow ];
                        load.
                 ] runOnce: true.
        StartupAction name: 'Show any startup action errors' code: [ StartupPref
erencesLoader default errors ifNotEmpty: [ :errors | errors explore ] ].
}.
