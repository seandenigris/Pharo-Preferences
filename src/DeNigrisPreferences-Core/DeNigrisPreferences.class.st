"
See ${class:BaselineOfDeNigrisPreferences}$ for main project documentation.
"
Class {
	#name : #DeNigrisPreferences,
	#superclass : #Object,
	#instVars : [
		'lastLoadOnce'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'DeNigrisPreferences-Core'
}

{ #category : #utilities }
DeNigrisPreferences class >> basicRun: str [ 
	^ LibC system: str
]

{ #category : #utilities }
DeNigrisPreferences class >> extractTimestampsFromChunk: source [

	| timestampParser |
	self error: 'what about single digit months/days? 2015 is hard-coded'.
	timestampParser := #digit asParser, #digit asParser, $/ asParser, #digit asParser, #digit asParser, '/2015 ' asParser, #digit asParser, #digit asParser, $: asParser, #digit asParser, #digit asParser.
	timestampParser := timestampParser flatten.
	^ (timestampParser island ==> #second) star parse: source
]

{ #category : #'class initialization' }
DeNigrisPreferences class >> initialize [

	Smalltalk
		addToStartUpList: self;
		addToShutDownList: self
]

{ #category : #'instance creation' }
DeNigrisPreferences class >> instance [

	^ instance ifNil: [ instance := self new ].
]

{ #category : #locations }
DeNigrisPreferences class >> laptopRepositoryRoot [

	^ FileLocator home / 'Dynabook' / 'Repositories'.
]

{ #category : #Launcher }
DeNigrisPreferences class >> launcherAddUserTemplates [
	<script>
	"Needs to be a script because will need to be rerun after sources refreshed"
	
	PharoLauncher addTemplateNamed: 'GToolkit' atUrl: 'https://github.com/feenkcom/gtoolkit/releases/latest/download/GT.zip' asUrl inGroupNamed: 'Sean'.
]

{ #category : #utilities }
DeNigrisPreferences class >> linkPreferenceSupportFiles [
	<script>

	| cloneFolder source target |
	cloneFolder := self localRepositoryRoot / 'DeNigris Preferences'.
	
	#('localRepositoryRoot' 'startup.st') do: [ :filename |
		source := cloneFolder / filename.
		target := StartupPreferencesLoader preferencesGeneralFolder / filename.
		LibC system: 'ln -s "', source fullName, '" "', target fullName, '"'. ]
]

{ #category : #locations }
DeNigrisPreferences class >> localRepositoryRoot [
 
	^ self laptopRepositoryRoot exists
		ifTrue: [ self laptopRepositoryRoot ]
		ifFalse: [ self usbRepositoryRoot ].
]

{ #category : #private }
DeNigrisPreferences class >> log: aString [

	UIManager default defer: [ UIManager default inform: 'DeNigrisPreferences: ', aString ].
	Transcript show: aString; cr.
]

{ #category : #'world menu' }
DeNigrisPreferences class >> menuCommandOn: aBuilder [ 
	<worldMenu> 
	
	(aBuilder item: #'My Pharo Wiki')
		action: [ "Smalltalk tools" WebBrowser openOn: 'https://github.com/seandenigris/pharo/wiki' ];
		"parent: #MostUsedTools;"
		"help: 'Looking for something ?';"
		icon: Smalltalk ui icons help.

	(aBuilder item: #Bootstraps)
		with: [
			(aBuilder item: #'SmallWorld')
				action: [ self instance loadSmallWorld ].
			(aBuilder item: #'DeNigrisSetup')
				action: [ self instance loadSetup ] ].
	(aBuilder item: #'Use LatAm Mirror')
				action: [ self instance useLatAmMirror ].
	(aBuilder item: #'IDE enhancements')
				action: [ self instance loadDevEnhancements ].
	(aBuilder item: #'Where Am I?')
				action: [ self instance informImageFolder ].
]

{ #category : #accessing }
DeNigrisPreferences class >> pillarBooklet [
	<gtExample> "Not an example, but want to inspect result when clicked in tools"

	^ FileLocator home / 'Dynabook'/'Repositories'/'seandenigris'/'Booklet-PublishingAPillarBooklet' / 'book.pillar'
]

{ #category : #accessing }
DeNigrisPreferences class >> pillarCheatsheet [
	<gtExample> "Not an example, but want to inspect result when clicked in tools"
	^ GtDocumenter forText: '!Cheatsheet
"Show markup" to see syntax
!!Headings
!!References and Links
@anchorDefinition
*@anchorReference*
*optionalAlias>anchorReference*
*AnotherFile.pillar@anchorReference*
*Web link to Pharo>https://pharo.org*
*Email to join the Pharo Consortium>board@pharo.org*
!!!Lists
- Bulleted
# Numbered
#-Nested
;Definition.
:term
!!!Comments
% lines that start with percent sign will not be rendered
!!!Escaping
\!Precede special characters with backslash
!!!Formatting
""bold with 2 double quotes""
''italic with 2 single quotes''
==monospaced==
--strikethrough--
@@subscript@@
^^superscript^^
__underline with 2 underscores__
!!!Pictures
+caption>file://filename|parame-
ters+
!!!Tables

|!Country |!Capital
|France | Paris
|Belgium | Brussels
!!!Preformatted
= Preformatted text
!!!Code Block
[[[label=foobar|caption=My code block that works|language=smalltalk|lineNumber=true
1+1
]]]
Highlight language options: bash, css, html, http, json, javascript, pillar, sql, ston, shellcommands, smalltalk or "no language"
!!!Annotated Paragraphs
@@note this is a note
@@todo this is a todo
!!!Raw
{{{html:
       (1+sqrt(2)) / 2
}}}
!!!Extensions/Plugins
${tag:parameter=value|parameter2=value2}$'
]

{ #category : #locations }
DeNigrisPreferences class >> preferencesFolder [

	| generalPreferencesFolder |
	generalPreferencesFolder := self startupLoader default preferencesGeneralFolder.
	^ generalPreferencesFolder exists
		ifTrue: [ generalPreferencesFolder ]
		ifFalse: [ self usbRepositoryRoot parent / 'Preferences' ].
]

{ #category : #utilities }
DeNigrisPreferences class >> run: aString [
	"self run: 'open http://www.google.com'." 

	| exitCode |
	exitCode := self basicRun: aString.
	exitCode = 0 ifFalse: [ self error: '"', aString, '" failed with ', exitCode asString ].
]

{ #category : #utilities }
DeNigrisPreferences class >> saveStartupScript [
	<script>

	| loadActionBlock loadAction showErrorsAction |
	self error: 'maybe broken'.
	loadActionBlock := [ 
		Gofer it
			smalltalkhubUser: 'SeanDeNigris' project: 'DeNigrisPreferences';
			package: 'DeNigrisPreferences-Core';
			load ].
	loadAction := StartupAction name: 'Load One-time Preferences' code: loadActionBlock runOnce: true.
		
	showErrorsAction := StartupAction
		name: 'Show any startup action errors'
		code: [ StartupPreferencesLoader default errors ifNotEmpty: [ :errors | errors explore ] ]
		runOnce: false.
	
	StartupPreferencesLoader default addAtStartupInGeneralPreferenceFolder: { loadAction. showErrorsAction }.
]

{ #category : #UI }
DeNigrisPreferences class >> scriptBrowser [
	<script>
	| browser utils scripts |
	utils := self methodsInProtocol: 'utilities'.
	scripts := utils select: [ :u | u selector isUnary ].
	browser := browser := GLMTabulator new.
	browser
		column: #one;
		column: #two.
	browser transmit
		to: #one;
		andShow: [ :a | 
			a list
				format: [ :scr | scr selector normalizeCamelCase capitalized ];
				onChangeOfPort: #strongSelection
					act: [ :pres | pres selection valueWithReceiver: DeNigrisPreferences new arguments: #() ] ].
	browser transmit
		from: #one;
		to: #two;
		andShow: [ :a | a pharoMethod display: #sourceCode ].
	"The following two lines could be replaced by #openOn:, but we'll keep them for documentation because #startOn: is what you would use when prototyping in the Moose Editor"
	browser startOn: scripts.
	browser open

]

{ #category : #locations }
DeNigrisPreferences class >> sharedCacheFolder [

	^ self localRepositoryRoot / 'Shared Cache'.
]

{ #category : #'startup/shutdown' }
DeNigrisPreferences class >> startUp: newSession [

	DeNigrisPreferences instance startUp: newSession.
]

{ #category : #accessing }
DeNigrisPreferences class >> startupLoader [

	^ StartupPreferencesLoader
]

{ #category : #private }
DeNigrisPreferences class >> transcriptIsOpen [

	World submorphThat: [ :e | e model = Transcript ] ifNone: [ ^ false ].
	^ true.
]

{ #category : #locations }
DeNigrisPreferences class >> usbRepositoryRoot [

"	| isMac |
	isMac := FileLocator imageDirectory pathSegments first = 'Volumes'."
	^ '/Volumes/SEAN/Smalltalk/Repositories' asFileReference.
]

{ #category : #MC }
DeNigrisPreferences >> addMyMcRepos [

	| urls |
	urls := { self myMetaRepoUrl. self myOutboxRepoUrl. self myPlaygroundRepoUrl }.
	urls do: [ :url | | repo |
		repo := MCHttpRepository location: url asString.
		MCRepositoryGroup default addRepository: repo ].
	MlFrontDesk new
		logInToSqueakSource;
		logInToSqueakSource3;
		logInToSmalltalkHub.
]

{ #category : #testing }
DeNigrisPreferences >> areNonUpdateScriptPackagesPresent [

	| updateMessage updateMethod scriptMessage filesLoadedByScript scriptPackagesNotLoaded packagesNotInScript |
	updateMessage := ('update', SystemVersion current highestUpdate asString) asSymbol.
	updateMethod := ScriptLoader >> updateMessage.
	scriptMessage := (updateMethod literalStrings detect: [ :e | e matchesRegex: 'script[[:digit:]]+' ]) asSymbol.
	filesLoadedByScript := ScriptLoader new perform: scriptMessage.

	scriptPackagesNotLoaded := filesLoadedByScript reject: [ :e | MCPackage allInstances anySatisfy: [ :f | e beginsWith: f name ] ].

	packagesNotInScript := MCPackage allInstances reject: [ :e | filesLoadedByScript anySatisfy: [ :f | f beginsWith: e name ] ].

	^ scriptPackagesNotLoaded isEmpty and: [ packagesNotInScript isEmpty ].
]

{ #category : #'private-loading' }
DeNigrisPreferences >> basicLoadEachStartup [

	self log: 'Loading "each startup" script...'.

	Author fullName: 'SeanDeNigris'.
	
	"Set paths on each startup because they will be different if we are on a USB stick"
	self useSharedCacheRepository.
	self setLocalRepositoryRoot.
	
	self updateTheme.
	self confirmCorrectVM.
"	self syncSharedCaches."
	self setMcConfigurationFolder.

	self hasLoadOnceChanged ifFalse: [ ^ self ].
	self log: 'Latest version of load-once script has never been run...'.
	self loadOnce
]

{ #category : #utilities }
DeNigrisPreferences >> browseMethodsSelect: aBlock [
	"self new browseMethodsSelect: [ :e | e dateMethodLastSubmitted = '1/24/2010'  asDate ]"

	[ :job | SystemNavigation new browseAllSelect: [ :e | 
			job increment.
			aBlock value: e ] ] asJob
		max: 100000;
		run.
]

{ #category : #actions }
DeNigrisPreferences >> closeWelcomeWindow [

	| welcomeWindows |
	welcomeWindows := World windowsSatisfying: [ :e | e label beginsWith: 'Welcome to Pharo' ].
	welcomeWindows do: [ :e | e delete ].
]

{ #category : #actions }
DeNigrisPreferences >> configureCompletion [

	NECPreferences
		enabled: true;
		caseSensitive: true;
		expandPrefixes: true;
		useEnterToAccept: false;
		smartCharacters: true;
		smartCharactersWithDoubleSpace: '[]{}';
		popupAutomaticDelay: 100.
	NECEntry spaceAfterCompletion: false.
]

{ #category : #actions }
DeNigrisPreferences >> configureFormatter [
	"See RBConfigurableFormatter class-side settings"
]

{ #category : #GT }
DeNigrisPreferences >> configureGT [
	GtPlaygroundToolRegistryAdaptor unregister.
]

{ #category : #actions }
DeNigrisPreferences >> configureIceberg [
	Iceberg enableMetacelloIntegration: true.
	
	"Enable the following if needed, but judging from comments in the community, it does not really fit well with git workflows"
	"IceLibgitRepository
		shareRepositoriesBetweenImages: true;
		sharedRepositoriesLocation: self class localRepositoryRoot"
]

{ #category : #Launcher }
DeNigrisPreferences >> configureLauncher [

	self setLauncherImageDirectory.
	self class launcherAddUserTemplates.
	PhLLaunchImageCommand warnOnArchMismatch: false. "Warns about 32-bit lib dependency on Linux"
	self loadSmallWorld.
]

{ #category : #actions }
DeNigrisPreferences >> confirmCorrectVM [
	"Mac OS X is really weird. No matter how many times you associate an app with a file type, it often silently changes and starts using a different version of Pharo"

	| normalVmLocations |
	"For Windows, we don't know the drive letter where the USB drive will be mounted, so we leave it out and pattern match.
	For Mac, right now we're assuming my home computer"
	normalVmLocations := 	#(
		'/usr/local/bin/pharo-vm/Pharo.app/Contents/MacOS/Pharo'
		'/Volumes/SEAN/Smalltalk/pharo-vm/Pharo.app/Contents/MacOS/Pharo'
		':\Smalltalk\pharo-vm\Win (92)\Pharo.exe').
	(normalVmLocations anySatisfy: [ :e | Smalltalk vm vmFileName includesSubstring: e ])
		ifFalse: [ self log: 'Different VM: ', Smalltalk vm vmFileName ].
]

{ #category : #accessing }
DeNigrisPreferences >> daytimeTheme [

	^ PharoLightTheme
]

{ #category : #utilities }
DeNigrisPreferences >> disableLatAmMirror [

	(Smalltalk at: #MRManager) removeFrom: 'http://www.squeaksource.com/'.
]

{ #category : #utilities }
DeNigrisPreferences >> disablePackageCacheDuring: aBlock [

	| originalCacheDirectory tempCache |
	originalCacheDirectory := MCCacheRepository cacheDirectory.
	tempCache := (FileLocator imageDirectory / 'temporary-empty-package-cache') ensureDirectory.
	[ 
		MCCacheRepository cacheDirectory: tempCache.
		aBlock value.
	] ensure: [ 
		MCCacheRepository cacheDirectory: originalCacheDirectory.
		tempCache deleteAll ].
]

{ #category : #actions }
DeNigrisPreferences >> enableShortcutHelp [
	ShortcutReminder enabled: true.
]

{ #category : #utilities }
DeNigrisPreferences >> fixIcebergRepoLocations [
	"E.g. after an image is moved or renamed, its local Iceberg repos become broken because the locations are stored as static FileReferences instead of dynamic FileLocations following the image around. Limitation: assumes all images are stored in flat folders under root"
	| imageRoot repos |
	imageRoot := FileLocator home / 'Dynabook' / 'Working Images'.
	repos := IceLibgitRepository allSubInstances
		select: [ :e | 
			e location isNotNil
				and: [ (FileLocator imageDirectory contains: e location) not
						and: [ imageRoot contains: e location ] ] ].
	repos
		do: [ :e | 
			| oldPath newPath fixedLocation |
			oldPath := e location relativeTo: imageRoot.
			newPath := RelativePath withAll: oldPath segments allButFirst.
			fixedLocation := FileLocator imageDirectory withPath: newPath.
			e location: fixedLocation ]
]

{ #category : #fixes }
DeNigrisPreferences >> fixIssue5656 [
	"Issue 5656: Large fonts make tools slow 
 http://code.google.com/p/pharo/issues/detail?id=5656"

	| smallerFont |
	smallerFont := LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 12.
	StandardFonts defaultFont: smallerFont.
]

{ #category : #'private-testing' }
DeNigrisPreferences >> hasLoadOnceChanged [

	^ lastLoadOnce ~= (self class>>#loadOnce) timeStamp.
]

{ #category : #actions }
DeNigrisPreferences >> informImageFolder [

	UIManager default inform: FileLocator imageDirectory fullName.
]

{ #category : #utilities }
DeNigrisPreferences >> installCalypso [

	Metacello new
  baseline: 'Calypso';
  repository: 'github://dionisiydk/Calypso';
  load.

	#ClyBrowser asClass beAllDefault
]

{ #category : #GT }
DeNigrisPreferences >> isGTImage [
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'GToolkit-' ]
]

{ #category : #Launcher }
DeNigrisPreferences >> isLauncherImage [
	
	^ Smalltalk globals hasClassNamed: #PhLDirectoryBasedImageRepository
]

{ #category : #'project loading' }
DeNigrisPreferences >> loadDevEnhancements [

	Metacello new
		baseline: 'Batcave';
		repository: 'github://seandenigris/Pharo-Enhancements';
		load
]

{ #category : #loading }
DeNigrisPreferences >> loadEachStartup [

	self basicLoadEachStartup.
]

{ #category : #loading }
DeNigrisPreferences >> loadOnce [

	self log: 'Loading one-time startup script...'.
	self configureIceberg.
	self closeWelcomeWindow.
	self setFonts.
	self configureFormatter.
	self isLauncherImage ifTrue: [ self configureLauncher ].
	self isGTImage ifTrue: [ self configureGT ].
	self configureCompletion.
	WorldState easySelectingWorld: true.
	Morph cycleHalosBothDirections: true.
	self addMyMcRepos.
	self enableShortcutHelp.
	lastLoadOnce := thisContext method timeStamp.
]

{ #category : #'project loading' }
DeNigrisPreferences >> loadSetup [

	Gofer it
		directory: (self class localRepositoryRoot / 'Setup') fullName;
		package: 'ConfigurationOfDeNigrisSetup';
		load.
		
	(Smalltalk at: #ConfigurationOfDeNigrisSetup) project bleedingEdge load.
]

{ #category : #'project loading' }
DeNigrisPreferences >> loadSmallWorld [
	Metacello new
		repository: 'github://seandenigris/Small-World';
		baseline: 'SmallWorld';
		load
]

{ #category : #logging }
DeNigrisPreferences >> log: aString [

	self class log: aString.
]

{ #category : #utilities }
DeNigrisPreferences >> migrate: oldProjectName fromSqueakSourceToSmalltalkHubAs: newProjectName [

	| source destination |
	
	self error: 'Moved to McProjectMigrate in Playground'.
	
	MlConfigurationFile new credentialsForSmalltalkHubDuring: [ :username :password |
		source := MCHttpRepository location: 'http://www.squeaksource.com/', oldProjectName.
		destination := MCSmalltalkhubRepository
		    owner: username
		    project: newProjectName
		    user: username
		    password: password ].

	#McProjectMigrate asClass new
		source: source;
		destination: destination;
		execute.
]

{ #category : #utilities }
DeNigrisPreferences >> myMetaRepoUrl [

	^ 'http://smalltalkhub.com/mc/SeanDeNigris/SeansMetaRepo/main' asUrl.
]

{ #category : #MC }
DeNigrisPreferences >> myOutboxRepoUrl [

	^ 'http://smalltalkhub.com/mc/SeanDeNigris/SeansOutbox/main' asUrl.
]

{ #category : #MC }
DeNigrisPreferences >> myPlaygroundRepoUrl [

	^ 'http://smalltalkhub.com/mc/SeanDeNigris/SeansPlayground/main' asUrl.
]

{ #category : #accessing }
DeNigrisPreferences >> nighttimeTheme [

	^ PharoDarkTheme
]

{ #category : #folders }
DeNigrisPreferences >> pharoRepositories [
	^ FileLocator home / 'Dynabook' / 'Repositories'
]

{ #category : #actions }
DeNigrisPreferences >> refreshPackageNamed: aString [

	| package |
	package := RPackageOrganizer default packageNamed: aString.
	package
		forceRefreshClassDefinedSelectors;
		forceRefreshMetaclassDefinedSelectors.
]

{ #category : #utilities }
DeNigrisPreferences >> replace: oldString with: newString in: file [
	"self new replace: 'fred' with: 'BOB' in: 'myfile.txt'"

	| original newContents |
	original := file asFileReference readStreamDo: [ :in | in contents ].
	newContents := original copyReplaceAll: oldString with: newString.
	file asFileReference writeStreamDo: [ :out | out nextPutAll: newContents ].
]

{ #category : #folders }
DeNigrisPreferences >> rootDataFolder [
	^ FileLocator home / 'Dynabook' / 'User Data'
]

{ #category : #actions }
DeNigrisPreferences >> setFonts [
	^ SourceCodeFonts setSourceCodeFonts: SourceCodeFonts sizeLarge.
]

{ #category : #Launcher }
DeNigrisPreferences >> setLauncherImageDirectory [
	#PhLDirectoryBasedImageRepository asClass location: FileLocator home / 'Dynabook' / 'Working Images'
]

{ #category : #actions }
DeNigrisPreferences >> setLocalRepositoryRoot [

	MCDirectoryRepository defaultDirectoryName: self class localRepositoryRoot fullName.
]

{ #category : #'private-loading' }
DeNigrisPreferences >> setMcConfigurationFolder [
	MlConfigurationFile folder: self class preferencesFolder
]

{ #category : #'startup/shutdown' }
DeNigrisPreferences >> startUp: newSession [

	newSession ifFalse: [ ^ self ].
	self loadEachStartup.
	self class startupLoader default errors ifNotEmpty: #explore.
]

{ #category : #utilities }
DeNigrisPreferences >> syncSharedCaches [
	"self new syncSharedCaches"

	DpSyncSharedCaches new execute.
]

{ #category : #actions }
DeNigrisPreferences >> updateTheme [
	"Try out the Dark Theme for now..."
	"(Time now between: '7:00am' asTime and: '9:00pm' asTime)
		ifTrue: [ self daytimeTheme installFullTheme ]
		ifFalse: [" self nighttimeTheme beCurrent "]"
]

{ #category : #utilities }
DeNigrisPreferences >> useLatAmMirror [

	Gofer new 
		url: 'http://dsal.cl/squeaksource/MetacelloRepository';
		package: 'ConfigurationOfMonticelloRedirect'; 
		load. 
	(Smalltalk at: #ConfigurationOfMonticelloRedirect) load. 
	(Smalltalk at: #MRManager) redirectFrom: 'http://www.squeaksource.com/' to: 'http://dsal.cl/squeaksource/'. 
]

{ #category : #actions }
DeNigrisPreferences >> useSharedCacheRepository [
	
	MCCacheRepository cacheDirectory resolve = self class sharedCacheFolder resolve ifTrue: [ ^ self ].
	[ MCCacheRepository cacheDirectory: self class sharedCacheFolder ensureCreateDirectory ]
		on: Error
		do: [ :err | UIManager default inform: 'Failed setting the shared cache' ]
]
