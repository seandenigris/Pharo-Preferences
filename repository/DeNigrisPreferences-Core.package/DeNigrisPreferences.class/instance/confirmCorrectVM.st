actions
confirmCorrectVM
	"Mac OS X is really weird. No matter how many times you associate an app with a file type, it often silently changes and starts using a different version of Pharo"

	| normalVmLocations |
	"For Windows, we don't know the drive letter where the USB drive will be mounted, so we leave it out and pattern match.
	For Mac, right now we're assuming my home computer"
	normalVmLocations := 	#(
		'/usr/local/bin/pharo-vm/Pharo.app/Contents/MacOS/Pharo'
		'/Volumes/SEAN/Smalltalk/pharo-vm/Pharo.app/Contents/MacOS/Pharo'
		':\Smalltalk\pharo-vm\Win (92)\Pharo.exe').
	(normalVmLocations anySatisfy: [ :e | Smalltalk vm vmFileName includesSubstring: e ])
		ifFalse: [ UIManager default inform: 'Different VM: ', Smalltalk vm vmFileName ].