actions
useSharedCacheRepository

	[ MCCacheRepository cacheDirectory: self class sharedCacheFolder ensureCreateDirectory ]
		on: Error
		do: [ | shouldLink |
			shouldLink := UIManager default confirm: 'Maybe the repository symlink has not been created. create it now?'.
			shouldLink ifTrue: [ NBMacShell run: 'ln -s ~/Dropbox/Repositories/ ~/Dynabook/Repositories' ] ]