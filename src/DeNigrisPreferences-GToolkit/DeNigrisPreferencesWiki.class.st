Class {
	#name : 'DeNigrisPreferencesWiki',
	#superclass : 'Object',
	#traits : 'TAPWiki',
	#classTraits : 'TAPWiki classTrait',
	#category : 'DeNigrisPreferences-GToolkit'
}

{ #category : 'wikiPages' }
DeNigrisPreferencesWiki class >> wikiPageGToolkit [
	"This method was automatically generated."
	<wikiPage: 'GToolkit'>
	^APWikiPage
		wiki: self
		name: 'GToolkit'
		text: 
'!Windows
Bulk change the window titles with ${method:GlutinWindowsRegistry>>#windowsDetailedTitleWithPrefix:andSuffix:}$. In a new GToolkit image, pass ==GlutinWindowsRegistry mainWindowTag== as the second argument to tag the "main" window i.e. the one that quits the app when it''s closed. On repeated title changes via this message, the tag will remain.'
]

{ #category : 'wikiPages' }
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
