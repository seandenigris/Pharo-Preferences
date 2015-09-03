Launcher
customizeLauncherImageFolder

	Smalltalk globals
		at: #PhLDirectoryBasedImageRepository
		ifPresent: [ :repoClass | repoClass location: FileLocator home / 'Documents' / 'Dynabook' / 'Working Images' ]