*DeNigrisPreferences-Platform
changesetSnippets
	"Until Bug 12278 is fixed in 3.0"
	
	ChangeSorterModel.
	ChangeSet newChangeSet.
	ChangeSet newChanges: (ChangeSet named: '').
	(ChangeSet named: 'Unnamed') assimilateAllChangesFoundIn: (ChangeSet named: '').