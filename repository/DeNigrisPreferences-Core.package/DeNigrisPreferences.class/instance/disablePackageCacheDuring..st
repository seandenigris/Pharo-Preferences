utilities
disablePackageCacheDuring: aBlock

	| originalCacheDirectory tempCache |
	originalCacheDirectory := MCCacheRepository cacheDirectory.
	tempCache := (FileLocator imageDirectory / 'temporary-empty-package-cache') ensureDirectory.
	[ 
		MCCacheRepository cacheDirectory: tempCache.
		aBlock value.
	] ensure: [ 
		MCCacheRepository cacheDirectory: originalCacheDirectory.
		tempCache deleteAll ].