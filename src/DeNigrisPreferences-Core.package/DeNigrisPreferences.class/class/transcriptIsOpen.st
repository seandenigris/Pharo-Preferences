private
transcriptIsOpen

	World submorphThat: [ :e | e model = Transcript ] ifNone: [ ^ false ].
	^ true.