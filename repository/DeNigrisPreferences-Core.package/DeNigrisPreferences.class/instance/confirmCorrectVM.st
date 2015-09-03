utilities
confirmCorrectVM
	"Mac OS X is really weird. No matter how many times you associate an app with a file type, it often silently changes and starts using a different version of Pharo"
	
	Smalltalk vm vmFileName = '/usr/local/bin/pharo-vm/Pharo.app/Contents/MacOS/Pharo'
		ifFalse: [ UIManager default inform: 'Different VM: ', Smalltalk vm vmFileName ].