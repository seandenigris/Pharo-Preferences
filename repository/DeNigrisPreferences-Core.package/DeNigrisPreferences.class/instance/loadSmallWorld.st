project loading
loadSmallWorld
	NBMacShell
		run: 'git clone git@github.com:seandenigris/SmallWorld.git ''' , FileLocator imageDirectory fullName , '/SmallWorld'''.
	Metacello new
		repository: 'filetree://' , FileLocator imageDirectory fullName , '/SmallWorld/repository';
		baseline: 'SmallWorld';
		onConflict: [ :ex | ex allow ];
		load