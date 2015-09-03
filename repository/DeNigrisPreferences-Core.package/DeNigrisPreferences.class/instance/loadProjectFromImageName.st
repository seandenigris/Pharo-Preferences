loading
loadProjectFromImageName
	"I'd like to do this via a real PharoMap... maybe SmallWorld, but to solve my immediate problem, I'll hack this in"
	
	DpMcConfigurationFile new credentialsForSmalltalkHubDuring: [ :user :pwd |
		Smalltalk imageFile base = 'DynaChef' ifTrue: [ 
			Gofer it
				url: 'http://smalltalkhub.com/mc/SeanDeNigris/DynaChef/main' username: user password: pwd;
				configuration;
				loadBleedingEdge ] ]