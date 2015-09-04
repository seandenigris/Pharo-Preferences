actions
useSharedCacheRepository

	[ MCCacheRepository cacheDirectory: self class sharedCacheFolder ensureCreateDirectory ]
		on: Error
		do: [ :err |
			UIManager default inform: 'Failed setting the shared cache'.
			self class sharedCacheFolder exists ifFalse: [ 
			UIManager default inform: 'Attempting to create the repository symlink...'.
			self class run: 'ln -s ~/Dropbox/Repositories/ ~/Dynabook/Repositories'.
			self class sharedCacheFolder exists ifTrue: [ err retry ] ] ]