Extension { #name : #MetacelloConfigurationBrowserPane }

{ #category : #'*DeNigrisPreferences-Platform' }
MetacelloConfigurationBrowserPane >> availableRepositories [

	^Array 
			with: DeNigrisPreferences new myMetaRepoUrl asString
			with: self class pharoDistributionRepository
		    with: 'http://ss3.gemtalksystems.com/ss/MetaRepoForPharo20' 	
		    with: 'http://www.squeaksource.com/MetacelloRepository'
			
]
