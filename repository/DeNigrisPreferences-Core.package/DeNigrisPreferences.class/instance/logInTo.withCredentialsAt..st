repo authentication
logInTo: urlRegexString withCredentialsAt: headingString

	| relevantRepos |
	relevantRepos := MCHttpRepository allSubInstances select: [:each | 
		urlRegexString asRegex matches: each locationWithTrailingSlash ].
	DpMcConfigurationFile new 
		credentialsFor: headingString
		during: [ :username :password |
			relevantRepos do: [:each | each user: username; password: password ] ]. 