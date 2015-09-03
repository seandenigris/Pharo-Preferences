Launcher
customizeLauncherImageFolder

	Smalltalk globals at: #PharoLauncher ifAbsent: [ ^ self ] .
	PhLDirectoryBasedImageRepository location: FileLocator home / 'Documents' / 'Dynabook' / 'Working Images'.