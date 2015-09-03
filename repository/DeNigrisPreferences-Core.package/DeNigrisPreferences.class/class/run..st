utilities
run: str 
	"self run: 'open http://www.google.com'." 

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode > 
	^ self nbCall: #( int system (String str) ) module: NativeBoost CLibrary