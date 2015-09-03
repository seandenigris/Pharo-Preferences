themes
updateTheme
	Time now < '9:00pm' asTime
		ifTrue: [ Pharo3Theme installFullTheme ]
		ifFalse: [ self nighttimeTheme installFullTheme ]