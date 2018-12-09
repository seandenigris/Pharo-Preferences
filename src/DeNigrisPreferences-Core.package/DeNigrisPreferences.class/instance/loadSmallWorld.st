project loading
loadSmallWorld
	Metacello new
		repository: 'github://seandenigris/Small-World:master/repository';
		baseline: 'SmallWorld';"
		onConflict: [ :ex | ex allow ];"
		load