baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'DeNigrisPreferences-Core'  with: [
				spec includes: #'DeNigrisPreferences-Platform'. ];
			package: #'DeNigrisPreferences-Platform' with: [
				spec requires: #'DeNigrisPreferences-Core'. ] ].

	spec for: #'pharo2.x' do: [
		spec package: #'DeNigrisPreferences-Platform' with: [ #'DeNigrisPreferences-Platform.pharo20' ]. ].
	
	spec for: #'pharo3.x' do: [
		spec package: #'DeNigrisPreferences-Platform' with: [ #'DeNigrisPreferences-Platform.pharo30' ]. ].
	
	spec for: #'pharo4.x' do: [
		spec package: #'DeNigrisPreferences-Platform' with: [ #'DeNigrisPreferences-Platform.pharo40' ] ]