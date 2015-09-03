syncing
push
	"Poor man's UI: throw up an explorer on the unsynced files for review, and throw a halt in the sync code until the user has a chance to review them... the cobbler's children, eh..."

	| unsyncedFiles |
	unsyncedFiles := self mczFilesIn: self folder missingFrom: self laptopSharedCache.
	unsyncedFiles explore.
	Halt now.
	self sync: unsyncedFiles to: self laptopSharedCache.