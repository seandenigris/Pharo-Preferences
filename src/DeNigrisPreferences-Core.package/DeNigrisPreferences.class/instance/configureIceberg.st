actions
configureIceberg
	Iceberg enableMetacelloIntegration: true.
	
	"Enable the following if needed, but judging from comments in the community, it does not really fit well with git workflows"
	"IceLibgitRepository
		shareRepositoriesBetweenImages: true;
		sharedRepositoriesLocation: self class localRepositoryRoot"