actions
configureIceberg
	Iceberg enableMetacelloIntegration: true.
	IceLibgitRepository
		shareRepositoriesBetweenImages: true;
		sharedRepositoriesLocation: self class localRepositoryRoot