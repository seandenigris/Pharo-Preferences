utilities
useLatAmMirror

	Gofer new 
		url: 'http://dsal.cl/squeaksource/MetacelloRepository';
		package: 'ConfigurationOfMonticelloRedirect'; 
		load. 
	(Smalltalk at: #ConfigurationOfMonticelloRedirect) load. 
	(Smalltalk at: #MRManager) redirectFrom: 'http://www.squeaksource.com/' to: 'http://dsal.cl/squeaksource/'. 