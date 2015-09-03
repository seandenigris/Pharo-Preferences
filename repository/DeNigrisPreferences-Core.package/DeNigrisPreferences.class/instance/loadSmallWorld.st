project loading
loadSmallWorld

	Gofer it
		directory: (self class localRepositoryRoot / 'Small World') fullName;
		package: 'ConfigurationOfSmallWorld';
		load.
		
	(Smalltalk at: #ConfigurationOfSmallWorld) project bleedingEdge load.