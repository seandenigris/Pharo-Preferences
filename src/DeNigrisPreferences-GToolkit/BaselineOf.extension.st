Extension { #name : #BaselineOf }

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> gtSetWindowTitles [
	| projectName |
	projectName := self name allButFirst: 'BaselineOf' size.
	GlutinWindowsRegistry default
		windowsDetailedTitleWithPrefix: projectName
		andSuffix: ''
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> markdownComment [
	| generationNotice pillar |
	generationNotice := '""DISCLAIMER"": You are looking at a boring, dead export of living (i.e. dynamic) documentation. To view it in its natural habitat in all its glory, fire up a GToolkit image and check the class comment of ', self name.
	pillar := GtDocumenterParser parse: self comment, String crlf, generationNotice.
	^ PRMarkdownWriter write: pillar
]

{ #category : #'*DeNigrisPreferences-GToolkit' }
BaselineOf class >> setUpGToolkit [
	| projectName |
	
	"Workaround for https://github.com/feenkcom/gtoolkit/issues/2115"
	RPackage organizer unregisterPackageNamed: 'TonelFixes'.
	
	self lepiter databases do: #load.
	self gtSetWindowTitles.
]
