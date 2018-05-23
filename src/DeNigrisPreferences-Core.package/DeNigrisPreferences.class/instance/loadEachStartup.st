loading
loadEachStartup

	self wasEachRunThisSession ifTrue: [
		"I want to figure out when this would be hit. I don't remember. After I figure it out, remove the exception.
		* One circumstance is if an image is saved, then is not properly shut down e.g. crashes"
		UIManager default inform: 'Preferences each load already run'.
		 ^ self ].
	wasEachRunThisSession := true.
	"self log: 'Updating...'.
	self class update."
	self basicLoadEachStartup.