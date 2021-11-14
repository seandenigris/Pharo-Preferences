"
Things that need to be in ''every'' image I develop in.
!Features
!!Metacello
- For GToolkit-specific code loading, make a ==GToolkit== platform attribute available by sending ${method:BaselineOf class>>#beGToolkitAware|label='#beGToolkitAware'}$ to your baseline.
"
Class {
	#name : #BaselineOfDeNigrisPreferences,
	#superclass : #BaselineOf,
	#category : #BaselineOfDeNigrisPreferences
}

{ #category : #baselines }
BaselineOfDeNigrisPreferences >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			postLoadDoIt: #postLoad;
			baseline: 'MonticelloLogin' with: [ 
				spec repository: 'github://seandenigris/Monticello-Login/repository' ];
			package: #'DeNigrisPreferences-Core' with: [
				spec requires: #'MonticelloLogin'. ] ].

	spec for: #'pharo2.x' do: [
		spec
			package: #'DeNigrisPreferences-Core' with: [
					spec includes: #'DeNigrisPreferences-Platform' ];
			package: #'DeNigrisPreferences-Platform' with: 'DeNigrisPreferences-Platform.pharo20' ].
	
	spec for: #'pharo3.x' do: [
		spec
			package: #'DeNigrisPreferences-Core' with: [
					spec includes: #'DeNigrisPreferences-Platform' ];
			package: #'DeNigrisPreferences-Platform' with: 'DeNigrisPreferences-Platform.pharo30'. ].
	
	spec for: #'pharo4.x' do: [
		spec
			package: #'DeNigrisPreferences-Core' with: [
					spec includes: #'DeNigrisPreferences-Platform' ];
			package: #'DeNigrisPreferences-Platform' with: 'DeNigrisPreferences-Platform.pharo40' ].

	spec for: #(#'pharo5.x' #'pharo6.x') do: [
		spec
			package: #'DeNigrisPreferences-Core' with: [
					spec includes: #'DeNigrisPreferences-Platform-Pharo6' ];
			package: #'DeNigrisPreferences-Platform-Pharo6' with: [
				spec requires: #'DeNigrisPreferences-Core' ] ].
		
	spec for: #(#'pharo8.x') do: [
		spec
			package: #'DeNigrisPreferences-Pharo8';
			package: #'DeNigrisPreferences-Core' with: [
					spec requires: #'DeNigrisPreferences-Pharo8' ] ].
					
	spec for: #'GToolkit' do: [
		spec package: #'DeNigrisPreferences-GToolkit' with: [ spec requires: #(#'DeNigrisPreferences-Core') ] ].
]

{ #category : #accessing }
BaselineOfDeNigrisPreferences >> customProjectAttributes [
	^ OrderedCollection streamContents: [ :col |
		self isGTImage
			ifFalse: [ col nextPut: #notGToolkit ]
			ifTrue: [ col nextPut: #GToolkit ].
		self isLepiterImage ifTrue: [ col nextPut: #Lepiter ]. ]
]

{ #category : #testing }
BaselineOfDeNigrisPreferences >> isGTImage [
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'GToolkit-' ]
]

{ #category : #testing }
BaselineOfDeNigrisPreferences >> isLepiterImage [
	"Lepiter has its own startup script mechanism, which ensures scripts get run before the DB is loaded; thus it's unlikely we will do anything for Lepiter here"
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ]
]

{ #category : #'post load' }
BaselineOfDeNigrisPreferences >> postLoad [
	DeNigrisPreferences instance loadEachStartup
]
