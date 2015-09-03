utilities
browseMethodsSelect: aBlock
	"self new browseMethodsSelect: [ :e | false ]"

	[ :job | SystemNavigation new browseAllSelect: [ :e | 
			job increment.
			aBlock value: e ] ] asJob
		max: 100000;
		run.