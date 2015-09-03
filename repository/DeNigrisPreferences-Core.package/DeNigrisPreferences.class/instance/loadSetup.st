project loading
loadSetup

	Gofer it
		directory: (self class localRepositoryRoot / 'Setup') fullName;
		package: 'ConfigurationOfDeNigrisSetup';
		load.
		
	(Smalltalk at: #ConfigurationOfDeNigrisSetup) project bleedingEdge load.