utilities
browseMethodsSelect: aBlock
	"self new browseMethodsSelect: [ :e | e dateMethodLastSubmitted = '1/24/2010'  asDate ]"

	[ :job | SystemNavigation new browseAllSelect: [ :e | 
			job increment.
			aBlock value: e ] ] asJob
		max: 100000;
		run.