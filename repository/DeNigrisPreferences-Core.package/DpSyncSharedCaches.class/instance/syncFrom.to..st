private
syncFrom: sourceFolder to: targetFolder 

	| exitCode commandTemplate command |
	commandTemplate := '/usr/bin/rsync -ravz --ignore-existing "{1}" "{2}"'.
	command := commandTemplate format: { sourceFolder fullNameWithIndicator. targetFolder fullName }.
	exitCode := DeNigrisPreferences run: command.
	exitCode = 0 ifFalse: [ self error: 'rsync failed with ', exitCode asString ].