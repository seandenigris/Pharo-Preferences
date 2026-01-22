Extension { #name : 'String' }

{ #category : '*DeNigrisPreferences-GToolkit' }
String >> copyToClipboardDescription: desc [
	<magritteActionDescription: #copyToClipboardDescription>

	^ desc
			gtIcon: [ BrGlamorousIcons clipboard ];
			yourself
]
