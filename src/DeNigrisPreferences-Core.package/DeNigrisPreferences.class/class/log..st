private
log: aString

	UIManager default defer: [ UIManager default inform: 'DeNigrisPreferences: ', aString ].
	Transcript show: aString; cr.