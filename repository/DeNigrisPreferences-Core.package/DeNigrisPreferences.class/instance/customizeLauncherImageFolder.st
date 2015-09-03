Launcher
customizeLauncherImageFolder

	Smalltalk globals
		at: #PhLDirectoryBasedImageRepository
		ifPresent: [ :repoClass | 
			"For now, we will symlink Dynabook in home because we're not sure where it will end up ultimately"
			repoClass location: FileLocator home / 'Dynabook' / 'Working Images' ]