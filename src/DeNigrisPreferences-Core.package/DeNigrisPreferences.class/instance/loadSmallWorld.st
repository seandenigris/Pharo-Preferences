project loading
loadSmallWorld
	Metacello new
		repository: 'github://seandenigris/Small-World';
		baseline: 'SmallWorld';"
		onConflict: [ :ex | ex allow ];"
		load