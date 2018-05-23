private
sync: files to: folder

	[ :job |
		files do: [ :e | 
			job increment.
			e copyTo: folder / e basename ]
	] asJob
		max: files size;
		run.
		