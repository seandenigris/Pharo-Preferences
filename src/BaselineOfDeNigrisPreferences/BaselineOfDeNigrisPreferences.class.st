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
			package: #'DeNigrisPreferences-Core'  with: [
				spec requires: #'MonticelloLogin'. ] ].

	spec for: #'pharo2.x' do: [
		spec
			package: #'DeNigrisPreferences-Core'  with: [
					spec includes: #'DeNigrisPreferences-Platform' ];
			package: #'DeNigrisPreferences-Platform' with: 'DeNigrisPreferences-Platform.pharo20' ].
	
	spec for: #'pharo3.x' do: [
		spec
			package: #'DeNigrisPreferences-Core'  with: [
					spec includes: #'DeNigrisPreferences-Platform' ];
			package: #'DeNigrisPreferences-Platform' with: 'DeNigrisPreferences-Platform.pharo30'. ].
	
	spec for: #'pharo4.x' do: [
		spec
			package: #'DeNigrisPreferences-Core'  with: [
					spec includes: #'DeNigrisPreferences-Platform' ];
			package: #'DeNigrisPreferences-Platform' with: 'DeNigrisPreferences-Platform.pharo40' ].

	spec for: #(#'pharo5.x' #'pharo6.x') do: [
		spec
			package: #'DeNigrisPreferences-Core'  with: [
					spec includes: #'DeNigrisPreferences-Platform-Pharo6' ];
			package: #'DeNigrisPreferences-Platform-Pharo6' with: [
				spec requires: #'DeNigrisPreferences-Core' ] ].
		
	spec for: #(#'pharo8.x') do: [
		spec
			package: #'DeNigrisPreferences-Pharo8';
			package: #'DeNigrisPreferences-Core'  with: [
					spec requires: #'DeNigrisPreferences-Pharo8' ] ].
]

{ #category : #'post load' }
BaselineOfDeNigrisPreferences >> postLoad [
	DeNigrisPreferences instance loadEachStartup
]
