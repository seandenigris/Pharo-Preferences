Extension { #name : #String }

{ #category : #'*DeNigrisPreferences-Core' }
String >> copyToClipboardDescription [
	<magritteActionDescription>
	^ MAActionDescription new	
			action: #copyToClipboard;
			priority: 1200;
			comment: 'Copy to clipboard';
			yourself
]
