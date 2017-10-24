actions
configureIceberg
	Iceberg enableMetacelloIntegration: true.
	IceRepository
		shareRepositoriesBetweenImages: true;
		sharedRepositoriesLocation: self class localRepositoryRoot