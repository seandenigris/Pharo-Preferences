actions
useSharedCacheRepository
	
	| dropboxRepoFolder |
	MCCacheRepository cacheDirectory resolve = self class sharedCacheFolder resolve ifTrue: [ ^ self ].
	dropboxRepoFolder := FileLocator home / 'Dropbox (Personal)' / 'Repositories'.
	dropboxRepoFolder exists
		ifTrue: [ 
			self class sharedCacheFolder exists ifFalse: [ 
				UIManager default inform: 'Attempting to create the repository symlink...'.
				self class run: 'ln -s ~/Dropbox/Repositories/ ~/Dynabook/Repositories' ] ]
		ifFalse: [ UIManager default inform: 'Dropbox repo folder doesn''t exist; creating new shared cache' ].
	[ MCCacheRepository cacheDirectory: self class sharedCacheFolder ensureCreateDirectory ]
		on: Error
		do: [ :err | UIManager default inform: 'Failed setting the shared cache' ]