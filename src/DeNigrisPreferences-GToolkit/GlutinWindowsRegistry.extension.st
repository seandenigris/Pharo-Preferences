Extension { #name : #GlutinWindowsRegistry }

{ #category : #'*DeNigrisPreferences-GToolkit' }
GlutinWindowsRegistry classSide >> mainWindowTag [
	^ ' - main'.
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
GlutinWindowsRegistry >> windowsDetailedTitleWithPrefix: prefixString andSuffix: suffixString [
	"Example usage:
		GlutinWindowsRegistry default windowsDetailedTitleWithPrefix: 'Magritte' andSuffix: ''
	"

	| titleTemplate defaultWorld |
	titleTemplate := '(GT ', GtImage instance version versionString, ')'.
	defaultWorld := BlSpace spaceWithId: GtWorld defaultId do: [ :w | w ].
	self windowsDo: [ :w | 
		| newTitle |
		newTitle := String streamContents: [ :str | 
			prefixString ifNotEmpty: [ :pre | str nextPutAll: pre; space ].
			str nextPutAll: titleTemplate.
			suffixString ifNotEmpty: [ :pre | str space; nextPutAll: pre ].
			defaultWorld hostSpace window = w ifTrue: [ str space; nextPutAll: self class mainWindowTag ] ].
		w title: newTitle ]
]
