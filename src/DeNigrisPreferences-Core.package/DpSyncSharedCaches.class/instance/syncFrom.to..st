private
syncFrom: sourceFolder to: targetFolder 

	| commandTemplate command |
	self flag: '#per Fundamentals: should be sourceFolder syncTo: targetFolder because there are no self sends'.
	"
	- Don't update existing files because mcz files should never be altered (--ignore-existing)
	- Ignore Mac hidden files i.e. starting with $. (--exclude=.*)
	- Recursive (-r)
	- Preserve meta-data (-a = archive)
	- Verbose (-v)
	- Compress during transfer (-z)"
	commandTemplate := '/usr/bin/rsync -ravz --ignore-existing --exclude=".DS_Store" --exclude="._*" "{1}" "{2}"'.
	command := commandTemplate format: { sourceFolder fullNameWithIndicator. targetFolder fullName }.
	DeNigrisPreferences run: command.