utilities
installDarkTheme
	"From http://forum.world.st/ANN-Pharo3-Dark-Theme-is-available-tp4757420.html"

	"1. You need this because otherwise Gofer merge becomes dumb :P"
	MCRepositoryGroup default 
	    addRepository: (MCSmalltalkhubRepository 
	        owner: 'estebanlm' 
	        project: 'Pharo3DarkTheme').
	"2. Now we can actually MERGE the project"
	Gofer it 
	    smalltalkhubUser: 'estebanlm' project: 'Pharo3DarkTheme';
	    package: 'Pharo3DarkTheme';
	    merge.
	"3. And then install it"
	#Pharo3DarkTheme asClass installFullTheme.