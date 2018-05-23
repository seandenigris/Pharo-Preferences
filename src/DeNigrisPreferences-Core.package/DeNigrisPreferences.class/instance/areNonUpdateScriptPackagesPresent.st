testing
areNonUpdateScriptPackagesPresent

	| updateMessage updateMethod scriptMessage filesLoadedByScript scriptPackagesNotLoaded packagesNotInScript |
	updateMessage := ('update', SystemVersion current highestUpdate asString) asSymbol.
	updateMethod := ScriptLoader >> updateMessage.
	scriptMessage := (updateMethod literalStrings detect: [ :e | e matchesRegex: 'script[[:digit:]]+' ]) asSymbol.
	filesLoadedByScript := ScriptLoader new perform: scriptMessage.

	scriptPackagesNotLoaded := filesLoadedByScript reject: [ :e | MCPackage allInstances anySatisfy: [ :f | e beginsWith: f name ] ].

	packagesNotInScript := MCPackage allInstances reject: [ :e | filesLoadedByScript anySatisfy: [ :f | f beginsWith: e name ] ].

	^ scriptPackagesNotLoaded isEmpty and: [ packagesNotInScript isEmpty ].