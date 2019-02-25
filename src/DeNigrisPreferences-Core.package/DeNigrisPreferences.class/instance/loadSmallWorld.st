project loading
loadSmallWorld
	Metacello new
		repository: 'github://seandenigris/Small-World/src';
		baseline: 'SmallWorld';"
		onConflict: [ :ex | ex allow ];"
		load