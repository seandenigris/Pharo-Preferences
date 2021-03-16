Extension { #name : #GlutinWindowsRegistry }

{ #category : #'*DeNigrisPreferences-GToolkit' }
GlutinWindowsRegistry class >> mainWindowTag [
	^ ' - main'.
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
GlutinWindowsRegistry >> windowsDetailedTitleWithPrefix: prefixString andSuffix: suffixString [
	"Example usage:
		GlutinWindowsRegistry default windowsDetailedTitleWithPrefix: 'Magritte' andSuffix: GlutinWindowsRegistry mainWindowTag
	"

	| titleTemplate |
	titleTemplate := '(GT ', GtImage instance version versionString, ')'.
	self windowsDo: [ :w | 
		| newTitle |
		newTitle := String streamContents: [ :str | 
			prefixString ifNotEmpty: [ :pre | str nextPutAll: pre; space ].
			str nextPutAll: titleTemplate.
			suffixString ifNotEmpty: [ :pre | str space; nextPutAll: pre ].
			"If this has been tagged as the main window, keep the tag"
			(w title endsWith: self class mainWindowTag) ifTrue: [ str space; nextPutAll: self class mainWindowTag ] ].
		w title: newTitle ]
]
