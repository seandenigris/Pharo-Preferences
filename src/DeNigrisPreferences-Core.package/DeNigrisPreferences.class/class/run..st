utilities
run: aString
	"self run: 'open http://www.google.com'." 

	| exitCode |
	exitCode := self basicRun: aString.
	exitCode = 0 ifFalse: [ self error: '"', aString, '" failed with ', exitCode asString ].