utilities
migrate: oldProjectName fromSqueakSourceToSmalltalkHubAs: newProjectName

	| source goSource destination goDestination files destinationFiles |

	DpMcConfigurationFile new credentialsForSmalltalkHubDuring: [ :username :password |
		source := MCHttpRepository location: 'http://www.squeaksource.com/', oldProjectName.
		destination := MCSmalltalkhubRepository
		    owner: username
		    project: newProjectName
		    user: username
		    password: password ].

	goSource := Gofer new repository: source.
	goDestination := Gofer new repository: destination.

	files := source allVersionNames.

	(goSource allResolved select: [ :resolved | files anySatisfy: [ :each |
	    resolved name = each ] ]) do: [ :each | goSource package: each packageName ].

	goSource fetch. "downloads all mcz on your computer"

	destinationFiles := destination allVersionNames. "checks what files are already at destination"
	files reject: [ :file | destinationFiles includes: file ] thenDo: [ :file |
	    goDestination version: file ]. "selects only the mcz that are not yet at destination"

	goDestination push. "sends everything to SmalltalkHub"

	self assert: destination allVersionNames sorted = files sorted.
	"checks we have exactly the same files at source and destination"