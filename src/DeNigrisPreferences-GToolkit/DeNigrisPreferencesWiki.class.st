Class {
	#name : #DeNigrisPreferencesWiki,
	#superclass : #Object,
	#traits : 'TAPWiki',
	#classTraits : 'TAPWiki classTrait',
	#category : #'DeNigrisPreferences-GToolkit'
}

{ #category : #wikiPages }
DeNigrisPreferencesWiki class >> wikiPageMetacello_Enhancements [
	"This method was automatically generated."
	<wikiPage: 'Metacello Enhancements'>
	^APWikiPage
		wiki: self
		name: 'Metacello Enhancements'
		text: 
'!IDE Cusomization
You can customize the location of e.g. Epicea session files and GToolkit xdocs. See ${method:BaselineOf class>>#setUpIDE}$ .

NB. Keeping as part of DeNigrisPreferences works for now because we are loading projects manually and not via command line handler. The latter could be a problem if run before DeNigrisPreferences is loaded.
'
]
