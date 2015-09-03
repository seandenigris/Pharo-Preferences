themes
updateTheme
	Time now < '9:00pm' asTime
		ifTrue: [ self daytimeTheme installFullTheme ]
		ifFalse: [ self nighttimeTheme installFullTheme ]