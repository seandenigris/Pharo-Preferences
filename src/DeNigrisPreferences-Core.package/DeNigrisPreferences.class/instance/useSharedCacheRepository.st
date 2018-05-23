actions
useSharedCacheRepository
	
	MCCacheRepository cacheDirectory resolve = self class sharedCacheFolder resolve ifTrue: [ ^ self ].
	[ MCCacheRepository cacheDirectory: self class sharedCacheFolder ensureCreateDirectory ]
		on: Error
		do: [ :err | UIManager default inform: 'Failed setting the shared cache' ]