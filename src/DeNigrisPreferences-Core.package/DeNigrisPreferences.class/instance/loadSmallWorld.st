project loading
loadSmallWorld
	Metacello new
		repository: 'github://seandenigris/Small-World:master/src';
		baseline: 'SmallWorld';"
		onConflict: [ :ex | ex allow ];"
		load