StartupLoader default executeAtomicItems: {
        StartupAction name: 'Load One-time Preferences' code: [
Gofer it
        smalltalkhubUser: 'SeanDeNigris' project: 'DeNigrisPreferences';
        package: 'DeNigrisPreferences-Core';
        load ] runOnce: true.
        "StartupAction name: 'Load One-time Preferences' code: [ (Smalltalk at: #DeNigrisPreferences) instance loadOnce ] runOnce: true.
        StartupAction name: 'Load Preferences at every startup' code: [ (Smalltalk at: #DeNigrisPreferences) instance loadEachStartup ]."
        StartupAction name: 'Show any startup action errors' code: [ StartupPreferencesLoader default errors ifNotEmpty: [ :errors | errors explore ] ].
