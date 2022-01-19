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
			baseline: 'Iterators' with: [
				spec repository: 'github://juliendelplanque/Iterators/src' ];
			baseline: 'MonticelloLogin' with: [ 
				spec repository: 'github://seandenigris/Monticello-Login' ];
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
		
	spec for: #(#'pharo7.x') do: [
		spec
			package: #'DeNigrisPreferences-Pharo7';
			package: #'DeNigrisPreferences-Core' with: [
					spec requires: #'DeNigrisPreferences-Pharo7' ] ].
			
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
	^ self isGTImage
		ifTrue: [ #(#GToolkit) ]
		ifFalse: [ #(#notGToolkit) ]
]

{ #category : #testing }
BaselineOfDeNigrisPreferences >> isGTImage [
	
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ].
	"Implementation note: used to check for GToolkit prefix, but P7 has a GToolkit-Examples package. Lepiter, OTOH, could only be loaded in a GT image"
]

{ #category : #'post load' }
BaselineOfDeNigrisPreferences >> postLoad [
	DeNigrisPreferences instance loadEachStartup
]
