syncing
pull

	| unsyncedFiles |
	unsyncedFiles := self mczFilesIn: self laptopSharedCache missingFrom: self folder.
	self sync: unsyncedFiles to: self folder.