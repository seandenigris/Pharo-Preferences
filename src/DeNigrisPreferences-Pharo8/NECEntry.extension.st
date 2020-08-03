Extension { #name : #NECEntry }

{ #category : #'*DeNigrisPreferences-Pharo8' }
NECEntry class >> spaceAfterCompletion: aBoolean [
	NECPreferences spaceAfterCompletion: aBoolean

	"NECPreferences `#spaceAfterCompletion` been moved to NECEntry in Pharo 9 because NECPreferences is attached to Settings subsystem which is a Morphic component and it will pull all morphic/tools/etc. dependences whenever included/referenced. That way, if we want to split the completion framework from Moprhic/Rubric, we need to inverse the dependency (instead NEEntry depending on NECPreferences, NECPreferences depending on NECEntry).
	
On the down side, usability seems a bit worse because the user now has to know about two objects to configure it. I wonder if `NECPreferences >> #spaceAfterCompletion:` should be readded calling this method..."
]
