utilities
linkPreferenceSupportFiles
	<script>

	| cloneFolder source target |
	cloneFolder := self localRepositoryRoot / 'DeNigris Preferences'.
	
	#('localRepositoryRoot' 'startup.st') do: [ :filename |
		source := cloneFolder / filename.
		target := StartupPreferencesLoader preferencesGeneralFolder / filename.
		LibC system: 'ln -s "', source fullName, '" "', target fullName, '"'. ]